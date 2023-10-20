CREATE DATABASE Ej6;
USE Ej6;

CREATE TABLE Peliculas(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
calificacion_edad int
);

CREATE TABLE Salas(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
codigo_pelicula int,
FOREIGN KEY (codigo_pelicula) REFERENCES Peliculas(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);