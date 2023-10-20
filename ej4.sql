CREATE DATABASE Ej4;
USE Ej4;

CREATE TABLE Departamentos (
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100),
presupuesto int
);

CREATE TABLE Empleados (
dni varchar(9) PRIMARY KEY,
nombre nvarchar(100),
apellidos nvarchar(255),
codigo_departamento int,
FOREIGN KEY (codigo_departamento) REFERENCES Departamentos(codigo)ON DELETE CASCADE ON UPDATE CASCADE
);