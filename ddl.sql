CREATE DATABASE IF NOT EXISTS defensa;
USE defensa;

-- =========================
-- TABLA: tipo_sistema
-- =========================
CREATE TABLE tipo_sistema (
    id_tipo_sistema INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(100),
    descripcion TEXT
);

-- =========================
-- TABLA: sistema
-- =========================
CREATE TABLE sistema (
    id_sistema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    estado ENUM('activo','inactivo','mantenimiento'),
    id_tipo_sistema INT,
    FOREIGN KEY (id_tipo_sistema) REFERENCES tipo_sistema(id_tipo_sistema)
);

-- =========================
-- TABLA: amenaza
-- =========================
CREATE TABLE amenaza (
    id_amenaza INT AUTO_INCREMENT PRIMARY KEY,
    tipo_amenaza VARCHAR(100),
    nivel_peligro ENUM('bajo','medio','alto','critico'),
    descripcion TEXT
);

-- =========================
-- TABLA: unidad_militar
-- =========================
CREATE TABLE unidad_militar (
    id_unidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    tipo_unidad VARCHAR(50),
    codigo_unidad VARCHAR(50)
);

-- =========================
-- TABLA: soldado
-- =========================
CREATE TABLE soldado (
    id_soldado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    rango VARCHAR(50),
    numero_id VARCHAR(50),
    id_unidad INT,
    FOREIGN KEY (id_unidad) REFERENCES unidad_militar(id_unidad)
);

-- =========================
-- TABLA: usuario
-- =========================
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    fecha_inicio DATETIME,
    estado ENUM('activo','inactivo')
);

-- =========================
-- TABLA: mision
-- =========================
CREATE TABLE mision (
    id_mision INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo_mision ENUM('defensa','ataque','vigilancia'),
    objetivo TEXT,
    resultado_final ENUM('exito','fallo','parcial'),
    estado ENUM('planificada','en_proceso','finalizada'),
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- =========================
-- TABLA: deteccion
-- =========================
CREATE TABLE deteccion (
    id_deteccion INT AUTO_INCREMENT PRIMARY KEY,
    id_sistema INT,
    id_operacion INT,
    id_amenaza INT,
    id_analista INT,
    latitud DECIMAL(10,6),
    longitud DECIMAL(10,6),
    fecha_hora DATETIME,
    confirmada TINYINT(1),
    FOREIGN KEY (id_sistema) REFERENCES sistema(id_sistema),
    FOREIGN KEY (id_amenaza) REFERENCES amenaza(id_amenaza),
    FOREIGN KEY (id_analista) REFERENCES soldado(id_soldado),
    FOREIGN KEY (id_operacion) REFERENCES mision(id_mision)
);

-- =========================
-- TABLA: intercepcion
-- =========================
CREATE TABLE intercepcion (
    id_intercepcion INT AUTO_INCREMENT PRIMARY KEY,
    id_deteccion INT,
    resultado ENUM('neutralizado','fallido','parcial'),
    estado ENUM('pendiente','en_proceso','completo'),
    recurso_utilizado VARCHAR(100),
    fecha_hora DATETIME,
    FOREIGN KEY (id_deteccion) REFERENCES deteccion(id_deteccion)
);

-- =========================
-- TABLA: nodo_mando
-- =========================
CREATE TABLE nodo_mando (
    id_nodo INT AUTO_INCREMENT PRIMARY KEY,
    id_sistema INT,
    ubicacion VARCHAR(100),
    nivel_decision ENUM('bajo','medio','alto'),
    tiempo_despliegue INT,
    FOREIGN KEY (id_sistema) REFERENCES sistema(id_sistema)
);

-- =========================
-- TABLA: equipo_ejecucion
-- =========================
CREATE TABLE equipo_ejecucion (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_soldado INT,
    id_sistema INT,
    fecha_asignacion DATETIME,
    activo TINYINT(1),
    FOREIGN KEY (id_soldado) REFERENCES soldado(id_soldado),
    FOREIGN KEY (id_sistema) REFERENCES sistema(id_sistema)
);