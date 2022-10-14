/* Видалення таблиць з каскадним видаленням 
можливих описів цілісності */

drop table user CASCADE CONSTRAINTS;
drop table developer CASCADE CONSTRAINTS;
drop table adding CASCADE CONSTRAINTS;
drop table recomendation CASCADE CONSTRAINTS;
drop table temperature CASCADE CONSTRAINTS;
drop table message CASCADE CONSTRAINTS;
drop table final_product CASCADE CONSTRAINTS;



/* Послідовності для заповнення таблиць */

CREATE SEQUENCE s_user;
CREATE SEQUENCE s_developer;
CREATE SEQUENCE s_message;
CREATE SEQUENCE s_adding;
CREATE SEQUENCE s_temperature;
CREATE SEQUENCE s_recomendation;
CREATE SEQUENCE s_final;


/* Cтворення таблиць */

CREATE TABLE user ( -- опис користувача
  user_id INT, -- id користувача
  full_name VARCHAR(120), -- ПІБ
  nickname VARCHAR(120), -- нікнейм
  phone VARCHAR(20), -- номер телефону
  photo_profile bytea -- фото профілю
);

CREATE TABLE developer ( -- опис розробника
 	developer_id INT, -- id розробника
 	position VARCHAR(50), -- посада
 	creation_date DATE, -- дата створення профілю
 	salary NUMBER(7,2), -- зарплатня
 	user_id INT -- id користувача
);

CREATE TABLE message ( -- опис повідомлень
	message_id INT, -- id повідомлення
	text VARCHAR(2000), -- текст повідомлення
 	sender_id INT, -- id відправника
	receiver_id INT -- id отримувача
);

CREATE TABLE adding ( -- опис доданого твору
  	music_id INT, -- id твору
  	name VARCHAR(150), -- назва твору
  	author VARCHAR(50), -- псевдонім чи ім'я виконавця
  	album VARCHAR(50), -- назва альбому
  	genre VARCHAR(50), -- жанр твору
  	note_val VARCHAR(50), -- тривалість музичного твору
  	user_id INT, -- id користувача
  	developer_id INT -- id розробника
);

CREATE TABLE temperature ( -- опис температури
  	value_id INT, -- id значення
  	temperature NUMBER(6,2), -- показник температури (в °C) 
  	humidity NUMBER(6,2), -- показник вологості
  	AirCond NUMBER(6,2), -- показник забрудненості повітря
  	AtmPres NUMBER(6,2), -- показник атмосферного тиску
  	user_id INT -- id користувача
);

CREATE TABLE recomendation (
  	recomendation_id INT, -- id рекомендації
  	values_id INT -- id значення
);

CREATE TABLE final_product ( -- опис доданого продукту
  	product_id INT, -- id продукту
  	music_id INT, -- id твору
  	user_id INT, -- id користувача
  	developer_id INT, -- id розробника
  	recomendation_id INT -- id рекомендації
);

/* Обмеження первиних ключів */
ALTER TABLE user ADD CONSTRAINT user_pk
PRIMARY KEY (user_id);
ALTER TABLE developer ADD CONSTRAINT developer_pk
PRIMARY KEY (developer_id);
ALTER TABLE message ADD CONSTRAINT message_pk
PRIMARY KEY (message_id);
ALTER TABLE adding ADD CONSTRAINT adding_pk
PRIMARY KEY (music_id);
ALTER TABLE temperature ADD CONSTRAINT temperature_pk
PRIMARY KEY (value_id);
ALTER TABLE recomendation ADD CONSTRAINT recomendation_pk
PRIMARY KEY (recomendation_id);
ALTER TABLE final_product ADD CONSTRAINT final_pk
PRIMARY KEY (product_id);

/* Обмеження зовнішніх ключів */
ALTER TABLE developer ADD CONSTRAINT developer_user_fk
FOREIGN KEY (user_id)
REFERENCES user(user_id);

ALTER TABLE message ADD CONSTRAINT message_rec_fk
FOREIGN KEY (receiver_id)
REFERENCES my_user(user_id);
ALTER TABLE message ADD CONSTRAINT message_sen_fk
FOREIGN KEY (sender_id)
REFERENCES my_user(user_id);

ALTER TABLE adding ADD CONSTRAINT adding_user_fk
FOREIGN KEY (user_id)
REFERENCES user(user_id);
ALTER TABLE adding ADD CONSTRAINT adding_developer_fk
FOREIGN KEY (developer_id)
REFERENCES user(developer_id);

ALTER TABLE temperature ADD CONSTRAINT temperature_user_fk
FOREIGN KEY (user_id)
REFERENCES user(user_id);

ALTER TABLE recomendations ADD CONSTRAINT recomend_value_fk
FOREIGN KEY (value_id)
REFERENCES temperature(value_id);

ALTER TABLE final_product ADD CONSTRAINT final_music_fk
FOREIGN KEY (music_id)
REFERENCES adding(music_id);
ALTER TABLE final_product ADD CONSTRAINT final_user_fk
FOREIGN KEY (user_id)
REFERENCES user(user_id);
ALTER TABLE final_product ADD CONSTRAINT final_developer_fk
FOREIGN KEY (developer_id)
REFERENCES developer(developer_id);
ALTER TABLE final_product ADD CONSTRAINT final_recomendation_fk
FOREIGN KEY (recomendation_id)
REFERENCES recomendation(recomendation_id);


/* Обмеження вмісту стовпчиків таблиць */
ALTER TABLE user ADD CONSTRAINT nickname_template
    CHECK (regexp_like(nickname, 
	           '@[a-z0-9_-]+'));

ALTER TABLE user ADD CONSTRAINT user_phone_template
    CHECK ( regexp_like(phone, 
	          '^(\([0-9]{3}\))?[0-9]{3}-[0-9]{4}$'));
			  
ALTER TABLE employee ADD CONSTRAINT emp_salary_range
	CHECK (salary between 0 and 1000000);
