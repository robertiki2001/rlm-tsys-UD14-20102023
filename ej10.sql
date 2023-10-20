CREATE DATABASE Ej10;
USE Ej10;

CREATE TABLE Cajeros(
codigo int PRIMARY KEY,
nom_apels nvarchar(255)
);

CREATE TABLE MaquinasRegistradoras(
codigo int PRIMARY KEY,
piso int
);

CREATE TABLE Productos(
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
precio int
);

CREATE TABLE Venta(
codigo_cajero int,
codigo_maquina_registradora int,
codigo_producto int,
FOREIGN KEY (codigo_cajero) REFERENCES Cajeros(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_maquina_registradora) REFERENCES MaquinasRegistradoras(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (codigo_producto) REFERENCES Productos(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (codigo_cajero, codigo_maquina_registradora, codigo_producto)
);