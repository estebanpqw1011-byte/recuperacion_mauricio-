USE defensa;

INSERT INTO amenaza (tipo_amenaza, nivel_peligro) VALUES
('Explosivo', 'critico'),
('Intrusion', 'alto'),
('Drone sospechoso', 'alto'),
('Ataque cibernetico', 'critico');

INSERT INTO operacion (nombre) VALUES
('Operacion Centinela'),
('Operacion Aguila'),
('Operacion Tormenta');

INSERT INTO sistema (nombre) VALUES
('Radar Norte'),
('Camara Termica'),
('Sensor Satelital');

INSERT INTO soldado (nombre, rango) VALUES
('Juan Perez', 'Teniente'),
('Carlos Ruiz', 'Sargento'),
('Luis Gomez', 'Capitan');

INSERT INTO deteccion (id_amenaza, id_operacion, id_sistema, id_analista, latitud, longitud, fecha_hora, confirmada) VALUES
(1,1,1,1,6.25184,-75.56359,'2026-05-01 10:00:00',1),
(2,2,2,2,6.25200,-75.56400,'2026-05-02 12:30:00',1),
(3,1,3,3,6.25300,-75.56500,'2026-05-03 08:15:00',0),
(4,3,1,1,6.25400,-75.56600,'2026-05-04 14:45:00',1);



reporte #1
SELECT d.id_deteccion,
       a.tipo_amenaza,
       a.nivel_peligro,
       d.latitud,
       d.longitud,
       d.fecha_hora,
       o.nombre AS operacion,
       sis.nombre AS sistema_detector
FROM deteccion d
INNER JOIN amenaza a ON d.id_amenaza = a.id_amenaza
INNER JOIN operacion o ON d.id_operacion = o.id_operacion
INNER JOIN sistema sis ON d.id_sistema = sis.id_sistema
INNER JOIN soldado sol ON d.id_analista = sol.id_soldado
WHERE a.nivel_peligro IN ('alto','critico')
AND d.confirmada = 1
ORDER BY 
CASE 
    WHEN a.nivel_peligro = 'critico' THEN 1
    WHEN a.nivel_peligro = 'alto' THEN 2
END;

reporte #2
SELECT sis.nombre, COUNT(*) AS total_detecciones
FROM deteccion d
INNER JOIN sistema sis ON d.id_sistema = sis.id_sistema
GROUP BY sis.nombre;

reporte #3
SELECT tipo_amenaza, nivel_peligro
FROM amenaza
WHERE nivel_peligro = 'critico';

reporte #4 
SELECT d.id_deteccion, sol.nombre AS analista, a.tipo_amenaza
FROM deteccion d
INNER JOIN soldado sol ON d.id_analista = sol.id_soldado
INNER JOIN amenaza a ON d.id_amenaza = a.id_amenaza;