const express = require('express');
const router = express.Router();
const db = require('../db')

function getSearchResults(aSearchParam) {
  const sql = `SELECT id, name, search FROM labels WHERE MATCH(search) AGAINST ('${aSearchParam}' IN BOOLEAN MODE);`
  return db.query(sql)
    .catch(err => {
      console.error(err)
    })
}

router.post('/search', async (req, res) => {
  res.json(await getSearchResults(req.body.query))
})

router.get('/', async (req, res) => {
  let sql = ''
  sql += 'SELECT name FROM books;'
  sql += 'SELECT name from songs;'
  sql += 'SELECT name FROM labels;'
  sql += 'SELECT name, search FROM labels;'

  const results = await db.query(sql)
    .catch(err => {
      console.error(err)
    })

  // count popular labels
  const existingLabels = results[3].filter(element => {
    return element.search
  })

  existingLabels.map(element => {
    element.count = element.search.split(',').length - 1
  })

  if (existingLabels.length > 1) {
    existingLabels.sort((a, b) => {
      return b.count - a.count
    })
  }

  res.render('index', {
    title: 'eLibrary',
    books: results[0],
    songs: results[1],
    labels: results[2],
    popular: existingLabels
  });
});

router.post('/add', (req, res) => {
  const { type, name, description } = req.body
  const sql = `INSERT INTO ${type}s (name, description) VALUES ("${name}", "${description}");`;

  db.query(sql)
    .then(result => res.redirect('/'))
    .catch(err => {
      console.error(err)
    })
});

router.post('/tag', async (req, res) => {
  const { book, song, label } = req.body
  let sql = ''

  if (book) {
    sql = `UPDATE books SET label_id = (SELECT id FROM labels WHERE name = '${label}') WHERE name = '${book}';`
  }
  if (song) {
    sql += `UPDATE songs SET label_id = (SELECT id FROM labels WHERE name = '${label}') WHERE name = '${song}';`
  }

  let searchParam = ''
  if (book && song) {
    searchParam = `${book} & ${song}, `
  } else {
    searchParam = `${book || song}, `
  }

  // get the current label for book/song
  const existingLabel = await getSearchResults(searchParam)

  // remove from existing search
  if (existingLabel.length > 0) {
    existingLabel.map(element => {
      // account for superset matches that we don't want to remove
      if (element.search === searchParam) {
        sql += `UPDATE labels SET search = '${element.search.replace(searchParam, '')}' WHERE id = ${element.id};`
      }
    })
  }

  // concat with new label
  sql += `UPDATE labels SET search = CONCAT(COALESCE(search, ''), '${searchParam}') WHERE name = '${label}';`

  if (sql) {
    db.query(sql)
      .then(result => res.redirect('/'))
      .catch(err => {
        console.error(err)
      })
  }
});

module.exports = router;
