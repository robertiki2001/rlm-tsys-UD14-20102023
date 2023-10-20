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
id_estacion int PRIMARY KEY,
FOREIGN KEY (id_estacion) REFERENCES Estacion(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- INSERTS para la tabla "Estacion"
INSERT INTO Estacion (latitud, longitud, altitud) VALUES
(40.7128, -74.0060, 10.5),
(34.0522, -118.2437, 25.3),
(51.5074, -0.1278, 5.7),
(48.8566, 2.3522, 35.0),
(37.7749, -122.4194, 15.2),
(52.5200, 13.4050, 50.9),
(35.682839, 139.759455, 45.6),
(41.8919, 12.5113, 30.8),
(52.3667, 4.8945, 5.0),
(30.2672, -97.7431, 18.3);

-- INSERTS para la tabla "Muestra"
INSERT INTO Muestra (fecha, temperatura_minima, temperatura_maxima, precipitaciones, humedad_minima, humedad_maxima, velocidad_viento_minima, velocidad_viento_maxima, id_estacion) VALUES
('2023-10-01', 10.5, 25.0, 'Lluvioso', 45.5, 70.2, 5.8, 15.4, 1),
('2023-10-02', 11.0, 26.2, 'Nublado', 42.3, 68.7, 6.2, 16.0, 2),
('2023-10-05', 14.5, 30.0, 'Despejado', 50.0, 76.8, 8.0, 20.1, 3),
('2023-10-06', 11.2, 25.9, 'Lluvioso', 47.3, 73.2, 7.4, 19.0, 4),
('2023-10-07', 13.2, 27.7, 'Nublado', 49.8, 75.6, 7.0, 17.8, 5),
('2023-10-08', 15.5, 31.2, 'Despejado', 52.6, 78.4, 8.5, 21.2, 6),
('2023-10-09', 12.8, 28.6, 'Lluvioso', 50.1, 76.5, 7.6, 19.8, 7),
('2023-10-10', 14.7, 29.8, 'Nublado', 51.5, 77.9, 7.2, 18.6, 8),
('2023-10-11', 16.5, 32.0, 'Despejado', 53.3, 79.7, 9.0, 22.0, 9),
('2023-10-12', 13.4, 27.0, 'Lluvioso', 49.0, 74.8, 7.8, 20.5, 10);

-- UPDATES para la tabla "Estacion"
UPDATE Estacion SET latitud = 41.8781 WHERE id = 1;
UPDATE Estacion SET altitud = 12.7 WHERE id = 2;

-- UPDATES para la tabla "Muestra"
UPDATE Muestra SET temperatura_minima = 9.5 WHERE fecha = '2023-10-01' AND id_estacion = 1;
UPDATE Muestra SET temperatura_maxima = 27.0 WHERE fecha = '2023-10-02' AND id_estacion = 2;

-- DELETES para la tabla "Estacion"
DELETE FROM Estacion WHERE id = 3;
DELETE FROM Estacion WHERE id = 4;
SELECT * FROM Muestra;
-- DELETES para la tabla "Muestra"
DELETE FROM Muestra WHERE id_estacion = 1;
DELETE FROM Muestra WHERE id_estacion = 2;
