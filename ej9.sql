CREATE DATABASE Ej9;
USE Ej9;

CREATE TABLE Cientificos(
dni varchar(8) PRIMARY KEY,
nom_apels nvarchar(255)
);

CREATE TABLE Proyecto(
id char(4) PRIMARY KEY,
nombre nvarchar(255),
horas int
);

CREATE TABLE Asignado_A(
cientifico varchar(8),
proyecto char(4),
FOREIGN KEY (cientifico) REFERENCES Cientificos(dni) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (proyecto) REFERENCES Proyecto(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (cientifico, proyecto)
);