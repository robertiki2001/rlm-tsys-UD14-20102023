CREATE DATABASE Ej3;
USE Ej3;

CREATE TABLE Fabricantes(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Articulos(
codigo int auto_increment PRIMARY KEY,
nombre varchar(100),
precio int,
codigo_fabricante int ,
FOREIGN KEY (codigo_fabricante) REFERENCES Fabricantes(codigo)
ON DELETE CASCADE ON UPDATE CASCADE
);