USE defensa;

INSERT INTO tipo_sistema (nombre_tipo, descripcion) VALUES
('Radar','Detección aérea'),
('Cámara','Vigilancia visual');

INSERT INTO sistema (nombre, estado, id_tipo_sistema) VALUES
('Radar Norte','activo',1),
('Camara Termica','activo',2);

INSERT INTO amenaza (tipo_amenaza, nivel_peligro, descripcion) VALUES
('Explosivo','critico','Alto riesgo'),
('Intrusion','alto','Acceso no autorizado');

INSERT INTO unidad_militar (nombre, tipo_unidad, codigo_unidad) VALUES
('Unidad Alfa','Infanteria','UA01');

INSERT INTO soldado (nombre, apellido, rango, numero_id, id_unidad) VALUES
('Juan','Perez','Teniente','123',1),
('Carlos','Ruiz','Sargento','456',1);

INSERT INTO usuario (nombre, email, fecha_inicio, estado) VALUES
('Admin','admin@mail.com','2026-01-01','activo');

INSERT INTO mision (id_usuario, tipo_mision, objetivo, resultado_final, estado, fecha_inicio, fecha_fin) VALUES
(1,'Defensa','Proteger zona','exito','finalizada','2026-01-01','2026-01-02');

INSERT INTO deteccion (id_sistema, id_operacion, id_amenaza, id_analista, latitud, longitud, fecha_hora, confirmada) VALUES
(1,1,1,1,6.25,-75.56,'2026-05-01',1),
(2,1,2,2,6.26,-75.57,'2026-05-02',1);

INSERT INTO intercepcion (id_deteccion, resultado, estado, recurso_utilizado, fecha_hora) VALUES
(1,'neutralizado','completo','dron','2026-05-01');

INSERT INTO nodo_mando (id_sistema, ubicacion, nivel_decision, tiempo_despliegue) VALUES
(1,'Base Norte','alto',10);

INSERT INTO equipo_ejecucion (id_soldado, id_sistema, fecha_asignacion, activo) VALUES
(1,1,'2026-05-01',1);