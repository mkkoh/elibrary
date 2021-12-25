CREATE DATABASE elibrary;
USE elibrary; 

create table labels
(
	id          int auto_increment,
	name        varchar(100) not null,
	description varchar(200) null,
	search      text         null,
	constraint labels_pk
		primary key (id),
		fulltext index labels_search_index (search)
);

create table books
(
	id          int auto_increment,
	name        varchar(100) not null,
	description varchar(200) null,
	label_id    int          null,
	constraint books_pk
		primary key (id),
	constraint books_labels_id_fk
		foreign key (label_id) references labels (id),
		unique index books_name_uindex (name)
);

create table songs
(
	id          int auto_increment,
	name        varchar(100) not null,
	description varchar(200) null,
	label_id    int          null,
	constraint songs_pk
		primary key (id),
	constraint songs_labels_id_fk
		foreign key (label_id) references labels (id),
		unique index songs_name_uindex (name)
);


-- book labels
INSERT INTO labels (name, description) VALUES ('action', 'the fact or process of doing something, typically to achieve an aim.');
INSERT INTO labels (name, description) VALUES ('adventurous', 'willing to take risks or to try out new methods, ideas, or experiences.');
INSERT INTO labels (name, description) VALUES ('biographical', '(of data or a written work) dealing with a particular persons life.');
INSERT INTO labels (name, description) VALUES ('creepy', 'causing an unpleasant feeling of fear or unease.');
INSERT INTO labels (name, description) VALUES ('dark', 'hidden from knowledge; mysterious.');
INSERT INTO labels (name, description) VALUES ('easy-to-read', 'the presentation of text in an accessible, easy to understand format.');
INSERT INTO labels (name, description) VALUES ('educational', 'relating to the provision of education.');
INSERT INTO labels (name, description) VALUES ('goofy', 'foolish or harmlessly eccentric.');
INSERT INTO labels (name, description) VALUES ('heartbreaking', 'causing overwhelming distress; very upsetting.');
INSERT INTO labels (name, description) VALUES ('hilarious', 'extremely amusing.');
INSERT INTO labels (name, description) VALUES ('historical', 'of or concerning history or past events.');
INSERT INTO labels (name, description) VALUES ('inspirational', 'providing or showing creative or spiritual inspiration.');
INSERT INTO labels (name, description) VALUES ('romantic', 'conducive to or characterized by the expression of love.');
INSERT INTO labels (name, description) VALUES ('tragic', 'causing or characterized by extreme distress or sorrow.');
INSERT INTO labels (name, description) VALUES ('witty', 'showing or characterized by quick and inventive verbal humour.');

-- song labels
INSERT INTO labels (name, description) VALUES ('alternative rock', 'a style of rock music characterized as unconventional or outside the mainstream.');
INSERT INTO labels (name, description) VALUES ('country music', 'a form of popular music originating in the rural southern US.');
INSERT INTO labels (name, description) VALUES ('country rock', 'country rock is a subgenre of popular music, formed from the fusion of rock and country.');
INSERT INTO labels (name, description) VALUES ('dubstep', 'a form of dance music, typically instrumental, characterized by a sparse, syncopated rhythm and a strong bassline.');
INSERT INTO labels (name, description) VALUES ('electronic', 'a style of popular music deriving from techno and rave and having a more ambient, esoteric, or cerebral quality.');
INSERT INTO labels (name, description) VALUES ('folk', 'music that originates in traditional popular culture or that is written in such a style.');
INSERT INTO labels (name, description) VALUES ('hip hop', 'a genre of popular music developed in the United States by inner-city African Americans.');
INSERT INTO labels (name, description) VALUES ('j pop', 'J-pop, natively also known simply as pops, is a musical genre that entered the musical mainstream of Japan in the 1990s');
INSERT INTO labels (name, description) VALUES ('jazz', 'Jazz is a music genre that originated in the African-American communities of New Orleans, Louisiana, United States, in the late 19th and early 20th centuries.');
INSERT INTO labels (name, description) VALUES ('lo-fi', 'Lo-fi is a music or production quality in which elements usually regarded as imperfections of a recording or performance are audible.');
INSERT INTO labels (name, description) VALUES ('oldies', 'Oldies is a term for musical genres such as pop music, rock and roll, doo-wop, surf music from the second half of the 20th century.');
INSERT INTO labels (name, description) VALUES ('pop', 'Pop is a genre of popular music that originated in its modern form during the mid-1950s in the United States and the United Kingdom');
INSERT INTO labels (name, description) VALUES ('progressive trance', 'Progressive trance is a sub-genre in trance music , contains elements of house, techno, and ambient genres.');
INSERT INTO labels (name, description) VALUES ('r&b', 'Rhythm and blues, often abbreviated as R&B or RnB, is a genre of popular music that originated in African-American communities in the 1940s.');
INSERT INTO labels (name, description) VALUES ('rap', 'Hip hop music or hip-hop music, also known as rap music, is a genre of popular music developed in the United States by inner-city African Americans.');
INSERT INTO labels (name, description) VALUES ('rock', 'Rock music is a broad genre of popular music that originated as "rock and roll" in the United States in the late 1940s and early 1950s.');
INSERT INTO labels (name, description) VALUES ('soul', 'Soul music is a popular music genre that originated in the African American community throughout the United States in the 1950s and early 1960s.');
INSERT INTO labels (name, description) VALUES ('techno', 'Techno is a genre of electronic dance music that is predominantly characterized by a repetitive and hard four on the floor beat.');
INSERT INTO labels (name, description) VALUES ('trance', 'Trance is a genre of electronic dance music that emerged from the British new-age music scene.');
INSERT INTO labels (name, description) VALUES ('video game music', 'Video game music or is the soundtrack that accompanies video games.');
INSERT INTO labels (name, description) VALUES ('visual kei', 'Visual kei is a movement among Japanese musicians that is characterized by the use of varying levels of make-up.');
INSERT INTO labels (name, description) VALUES ('vocal trance', 'Vocal trance is a subgenre of trance music that focuses on vocals and melodies.');


INSERT INTO books (name, description) VALUES ('Fundamentals of Wavelets', 'Goswami, Jaideva	signal_processing	228	Wiley');
INSERT INTO books (name, description) VALUES ('Data Smart', 'Foreman, John	data_science	235	Wiley');
INSERT INTO books (name, description) VALUES ('God Created the Integers', 'Hawking, Stephen	mathematics	197	Penguin');
INSERT INTO books (name, description) VALUES ('Superfreakonomics', 'Dubner, Stephen	economics	179	HarperCollins');
INSERT INTO books (name, description) VALUES ('Orientalism', 'Said, Edward	history	197	Penguin');
INSERT INTO books (name, description) VALUES ('Nature of Statistical Learning Theory, The', 'Vapnik, Vladimir	data_science	230	Springer');
INSERT INTO books (name, description) VALUES ('Integration of the Indian States', 'Menon, V P	history	217	Orient Blackswan');
INSERT INTO books (name, description) VALUES ('Drunkards Walk, The', 'Mlodinow, Leonard	science	197	Penguin');
INSERT INTO books (name, description) VALUES ('Image Processing & Mathematical Morphology', 'Shih, Frank	signal_processing	241	CRC');
INSERT INTO books (name, description) VALUES ('How to Think Like Sherlock Holmes', 'Konnikova, Maria	psychology	240	Penguin');


INSERT INTO songs (name, description) VALUES ('Earth Song', 'I Didnt Mean To');
INSERT INTO songs (name, description) VALUES ('Better World', 'Soul Deep');
INSERT INTO songs (name, description) VALUES ('What A Wonderful World', 'Amor De Cabaret');
INSERT INTO songs (name, description) VALUES ('Doctor My Eyes', 'Something Girls');
INSERT INTO songs (name, description) VALUES ('Make a Little Wave', 'Face the Ashes');
INSERT INTO songs (name, description) VALUES ('Children Play With Earth', 'The Moon And I (Ordinary Day Album Version)');
INSERT INTO songs (name, description) VALUES ('Carbon Copy', 'Drop of Rain');
INSERT INTO songs (name, description) VALUES ('The Wake', 'Pink World');
INSERT INTO songs (name, description) VALUES ('Apple Tree', 'Insatiable (Instrumental Version)');
INSERT INTO songs (name, description) VALUES ('Tears of the trees', 'Young Boy Blues');