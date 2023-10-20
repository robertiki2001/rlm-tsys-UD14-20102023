CREATE DATABASE Ej8;
USE Ej8;

CREATE TABLE Piezas (
codigo int auto_increment PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Proveedores (
id char(4) PRIMARY KEY,
nombre nvarchar(100)
);

CREATE TABLE Suministra (
codigo_pieza int,
id_proveedor char(4),
precio int,
FOREIGN KEY (codigo_pieza) REFERENCES Piezas(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (codigo_pieza, id_proveedor)
);