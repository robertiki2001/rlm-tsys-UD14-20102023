CREATE DATABASE Ej5;
USE Ej5;	

CREATE TABLE Almacenes (
codigo int auto_increment PRIMARY KEY,
lugar nvarchar(100),
capacidad int
);

CREATE TABLE Cajas(
num_referencia char(5) PRIMARY KEY,
contenido nvarchar(100),
valor int,
almacen int,
codigo_almacen int,
FOREIGN KEY (codigo_almacen) REFERENCES Almacenes(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);