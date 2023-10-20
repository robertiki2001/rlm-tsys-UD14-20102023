CREATE DATABASE Ej7;
USE Ej7;

CREATE TABLE Despachos(
numero int auto_increment PRIMARY KEY,
capacidad int
);

CREATE TABLE Directores(
dni varchar(9) PRIMARY KEY,
nom_apels nvarchar(255),
dni_jefe varchar(9),
numero_despacho int,
FOREIGN KEY (dni_jefe) REFERENCES Directores(dni) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (numero_despacho) REFERENCES Despachos(numero) ON DELETE CASCADE ON UPDATE CASCADE
);