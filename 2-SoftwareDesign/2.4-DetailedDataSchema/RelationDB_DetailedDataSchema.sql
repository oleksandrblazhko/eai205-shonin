/* Видалення таблиць з каскадним видаленням 
можливих описів цілісності */

drop table user CASCADE CONSTRAINTS;
drop table developer CASCADE CONSTRAINTS;
drop table my_adding CASCADE CONSTRAINTS;
drop table adding CASCADE CONSTRAINTS;
drop table recomendation CASCADE CONSTRAINTS;
drop table temperature CASCADE CONSTRAINTS;
drop table message CASCADE CONSTRAINTS;
drop table final_product CASCADE CONSTRAINTS;



/*послідовності для заповнення таблиць */

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

CREATE TABLE recomendations (
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


