CREATE DATABASE IF NOT EXISTS defensa;
USE defensa;

CREATE TABLE amenaza (
    id_amenaza INT AUTO_INCREMENT PRIMARY KEY,
    tipo_amenaza VARCHAR(50) NOT NULL,
    nivel_peligro VARCHAR(20) NOT NULL
);

CREATE TABLE operacion (
    id_operacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE sistema (
    id_sistema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE soldado (
    id_soldado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rango VARCHAR(50)
);

CREATE TABLE deteccion (
    id_deteccion INT AUTO_INCREMENT PRIMARY KEY,
    id_amenaza INT,
    id_operacion INT,
    id_sistema INT,
    id_analista INT,
    latitud DECIMAL(10,6),
    longitud DECIMAL(10,6),
    fecha_hora DATETIME,
    confirmada BOOLEAN,

    FOREIGN KEY (id_amenaza) REFERENCES amenaza(id_amenaza),
    FOREIGN KEY (id_operacion) REFERENCES operacion(id_operacion),
    FOREIGN KEY (id_sistema) REFERENCES sistema(id_sistema),
    FOREIGN KEY (id_analista) REFERENCES soldado(id_soldado)
);