USE defensa;


-- REPORTE 1: Detecciones críticas y altas

SELECT d.id_deteccion,
    a.tipo_amenaza,
    a.nivel_peligro,
    d.fecha_hora
FROM deteccion d
JOIN amenaza a ON d.id_amenaza = a.id_amenaza
WHERE a.nivel_peligro IN ('alto','critico');



-- REPORTE 2: Detecciones con sistema y analista

SELECT d.id_deteccion,
    sis.nombre AS sistema,
    s.nombre AS analista
FROM deteccion d
JOIN sistema sis ON d.id_sistema = sis.id_sistema
JOIN soldado s ON d.id_analista = s.id_soldado;



-- REPORTE 3: Total de detecciones por sistema

SELECT sis.nombre,
    COUNT(*) AS total_detecciones
FROM deteccion d
JOIN sistema sis ON d.id_sistema = sis.id_sistema
GROUP BY sis.nombre;



-- REPORTE 4: Resultados de intercepciones

SELECT i.id_intercepcion,
    i.resultado,
    i.estado,
    d.id_deteccion
FROM intercepcion i
JOIN deteccion d ON i.id_deteccion = d.id_deteccion;



-- REPORTE 5: Misiones con usuario responsable

SELECT m.id_mision,
    u.nombre AS usuario,
    m.tipo_mision,
    m.estado
FROM mision m
JOIN usuario u ON m.id_usuario = u.id_usuario;