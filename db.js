const mysql = require('mysql');
require('dotenv').config()

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  connectionLimit: 10,
  multipleStatements: true
})

function query(sql) {
  console.log('DB QUERY: ' + sql)
  return new Promise((resolve, reject) => {
    pool.query(sql, (err, result) => {
      if (err) {
        console.error(err)
        reject(err)
      }
      resolve(result)
    })
  })
}

module.exports = { query }