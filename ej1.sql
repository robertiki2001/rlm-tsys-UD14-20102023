CREATE DATABASE Ej1;
USE Ej1;

CREATE TABLE Estacion(
id int auto_increment PRIMARY KEY,
latitud decimal(9,6),
longitud decimal(9,6),
altitud double
);

CREATE TABLE Muestra(
fecha date,
temperatura_minima double,
temperatura_maxima double,
precipitaciones varchar(20),
humedad_minima double,
humedad_maxima double,
velocidad_viento_minima double,
velocidad_viento_maxima double,
id_estacion int,
FOREIGN KEY (id_estacion) REFERENCES Estacion(id) ON DELETE CASCADE ON UPDATE CASCADE
);