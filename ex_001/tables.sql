CREATE DATABASE games;

USE games;

CREATE TABLE categorias (
	id_cat serial PRIMARY KEY,
	nome_cat varchar(30) NOT NULL UNIQUE
);

CREATE TABLE jogos (
	id_jogo serial PRIMARY KEY,
	nome_jogo varchar(30) NOT NULL,
	desc_jogo text NOT NULL,
	aval_jogo int DEFAULT NULL,
	cat_jogo int,
	FOREIGN KEY (cat_jogo) REFERENCES categorias (id_cat)
);

CREATE TABLE usuarios (
	id_usuario serial PRIMARY KEY,
	nome_usuario varchar(30) NOT NULL,
	email_usuario varchar(50) UNIQUE NOT NULL,
	senha_usuario varchar(32) NOT NULL,
	foto_usuario varchar(50),
	hash_usuario varchar(32) UNIQUE NOT NULL,
	tipo_usuario int NOT NULL DEFAULT 1,
	status_usuario boolean NOT NULL DEFAULT FALSE
);

INSERT INTO usuarios (
	nome_usuario,
	email_usuario,
	senha_usuario,
	hash_usuario)
VALUES (
	'Administrador',
	'admin',
	'21232f297a57a5a743894a0e4a801fc3',
	'hash');

