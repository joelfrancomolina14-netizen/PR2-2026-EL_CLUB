-- =========================================================
-- PROYECTO: EL CLUB OFICIAL DE BILLAR
-- BASE DE DATOS FISICA: elclubom
-- =========================================================

USE master;
GO

IF DB_ID('elclubom') IS NOT NULL
BEGIN
    DROP DATABASE elclubom;
END;
GO

CREATE DATABASE elclubom;
GO

USE elclubom;
GO

-- =========================================================
-- 1. CREACION DE TABLAS CON RESTRICCIONES (PK, FK, CHECK)
-- =========================================================

CREATE TABLE empleados (
    id_empleado INT IDENTITY(1,1) NOT NULL,
    ci VARCHAR(20) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT PK_empleados PRIMARY KEY (id_empleado),
    CONSTRAINT UQ_empleados_ci UNIQUE (ci),
    CONSTRAINT UQ_empleados_correo UNIQUE (correo)
);

CREATE TABLE duenos (
    id_empleado INT NOT NULL,
    nit VARCHAR(20) NOT NULL,
    participacion_pct DECIMAL(5,2) NOT NULL,
    CONSTRAINT PK_duenos PRIMARY KEY (id_empleado),
    CONSTRAINT FK_duenos_empleados FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    CONSTRAINT CK_duenos_participacion CHECK (participacion_pct >= 0 AND participacion_pct <= 100)
);

CREATE TABLE empleados_comunes (
    id_empleado INT NOT NULL,
    cargo VARCHAR(50) NOT NULL,
    sueldo DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_empleados_comunes PRIMARY KEY (id_empleado),
    CONSTRAINT FK_empleados_comunes_empleados FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    CONSTRAINT CK_empleados_comunes_sueldo CHECK (sueldo > 0)
);

CREATE TABLE telefonos_empleados (
    id_empleado INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT PK_telefonos_empleados PRIMARY KEY (id_empleado, telefono),
    CONSTRAINT FK_telefonos_empleados_empleados FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) NOT NULL,
    ci VARCHAR(20) NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    contrasena_hash VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    CONSTRAINT PK_clientes PRIMARY KEY (id_cliente),
    CONSTRAINT UQ_clientes_ci UNIQUE (ci),
    CONSTRAINT UQ_clientes_correo UNIQUE (correo)
);

CREATE TABLE telefonos_clientes (
    id_cliente INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT PK_telefonos_clientes PRIMARY KEY (id_cliente, telefono),
    CONSTRAINT FK_telefonos_clientes_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE mesas (
    id_mesa INT IDENTITY(1,1) NOT NULL,
    numero INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    tarifa_hora DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_mesas PRIMARY KEY (id_mesa),
    CONSTRAINT UQ_mesas_numero UNIQUE (numero),
    CONSTRAINT CK_mesas_tarifa CHECK (tarifa_hora >= 0)
);

CREATE TABLE horarios (
    id_horario INT IDENTITY(1,1) NOT NULL,
    dia_semana VARCHAR(15) NOT NULL,
    hora_apertura TIME NOT NULL,
    hora_cierre TIME NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_horarios PRIMARY KEY (id_horario)
);

CREATE TABLE mesas_horarios (
    id_mesa INT NOT NULL,
    id_horario INT NOT NULL,
    CONSTRAINT PK_mesas_horarios PRIMARY KEY (id_mesa, id_horario),
    CONSTRAINT FK_mesas_horarios_mesas FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa),
    CONSTRAINT FK_mesas_horarios_horarios FOREIGN KEY (id_horario) REFERENCES horarios(id_horario)
);

CREATE TABLE reservas (
    id_reserva INT IDENTITY(1,1) NOT NULL,
    id_cliente INT NOT NULL,
    id_mesa INT NOT NULL,
    id_empleado_comun INT NOT NULL,
    fecha_reserva DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    CONSTRAINT PK_reservas PRIMARY KEY (id_reserva),
    CONSTRAINT FK_reservas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_reservas_mesas FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa),
    CONSTRAINT FK_reservas_empleados FOREIGN KEY (id_empleado_comun) REFERENCES empleados_comunes(id_empleado)
);

CREATE TABLE usos_mesas (
    id_uso INT IDENTITY(1,1) NOT NULL,
    id_mesa INT NOT NULL,
    id_cliente INT NOT NULL,
    hora_inicio DATETIME NOT NULL,
    hora_fin DATETIME NOT NULL,
    CONSTRAINT PK_usos_mesas PRIMARY KEY (id_uso),
    CONSTRAINT FK_usos_mesas_mesas FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa),
    CONSTRAINT FK_usos_mesas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE torneos (
    id_torneo INT IDENTITY(1,1) NOT NULL,
    id_dueno INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    premio_total DECIMAL(10,2) NOT NULL,
    costo_inscripcion DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_torneos PRIMARY KEY (id_torneo),
    CONSTRAINT FK_torneos_duenos FOREIGN KEY (id_dueno) REFERENCES duenos(id_empleado),
    CONSTRAINT CK_torneos_premio CHECK (premio_total >= 0),
    CONSTRAINT CK_torneos_costo CHECK (costo_inscripcion >= 0)
);

CREATE TABLE torneos_eliminatorios (
    id_torneo INT NOT NULL,
    nro_rondas INT NOT NULL,
    tipo_eliminacion VARCHAR(30) NOT NULL,
    CONSTRAINT PK_torneos_eliminatorios PRIMARY KEY (id_torneo),
    CONSTRAINT FK_torneos_eliminatorios_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo),
    CONSTRAINT CK_torneos_elim_rondas CHECK (nro_rondas > 0)
);

CREATE TABLE torneos_liga (
    id_torneo INT NOT NULL,
    nro_jornadas INT NOT NULL,
    puntos_victoria INT NOT NULL,
    CONSTRAINT PK_torneos_liga PRIMARY KEY (id_torneo),
    CONSTRAINT FK_torneos_liga_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo),
    CONSTRAINT CK_torneos_liga_jornadas CHECK (nro_jornadas > 0)
);

CREATE TABLE torneos_mesas (
    id_torneo INT NOT NULL,
    id_mesa INT NOT NULL,
    CONSTRAINT PK_torneos_mesas PRIMARY KEY (id_torneo, id_mesa),
    CONSTRAINT FK_torneos_mesas_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo),
    CONSTRAINT FK_torneos_mesas_mesas FOREIGN KEY (id_mesa) REFERENCES mesas(id_mesa)
);

CREATE TABLE partidas (
    id_partida INT IDENTITY(1,1) NOT NULL,
    id_uso INT NOT NULL,
    id_torneo INT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    modalidad VARCHAR(30) NOT NULL,
    resultado VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_partidas PRIMARY KEY (id_partida),
    CONSTRAINT FK_partidas_usos FOREIGN KEY (id_uso) REFERENCES usos_mesas(id_uso),
    CONSTRAINT FK_partidas_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo)
);

CREATE TABLE participaciones_partidas (
    id_cliente INT NOT NULL,
    id_partida INT NOT NULL,
    CONSTRAINT PK_participaciones_partidas PRIMARY KEY (id_cliente, id_partida),
    CONSTRAINT FK_part_partidas_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_part_partidas_partidas FOREIGN KEY (id_partida) REFERENCES partidas(id_partida)
);

CREATE TABLE inscripciones (
    id_inscripcion INT IDENTITY(1,1) NOT NULL,
    id_cliente INT NOT NULL,
    id_torneo INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,
    estado_inscripcion VARCHAR(20) NOT NULL,
    CONSTRAINT PK_inscripciones PRIMARY KEY (id_inscripcion),
    CONSTRAINT FK_inscripciones_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT FK_inscripciones_torneos FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo)
);

CREATE TABLE pagos_inscripciones (
    id_pago INT IDENTITY(1,1) NOT NULL,
    id_inscripcion INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_pagos_inscripciones PRIMARY KEY (id_pago),
    CONSTRAINT FK_pagos_inscripciones_inscripciones FOREIGN KEY (id_inscripcion) REFERENCES inscripciones(id_inscripcion),
    CONSTRAINT CK_pagos_monto CHECK (monto >= 0)
);

CREATE TABLE productos (
    id_producto INT IDENTITY(1,1) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(MAX) NULL,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_productos PRIMARY KEY (id_producto),
    CONSTRAINT CK_productos_precio CHECK (precio > 0),
    CONSTRAINT CK_productos_stock CHECK (stock >= 0)
);

CREATE TABLE pedidos (
    id_pedido INT IDENTITY(1,1) NOT NULL,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    hora_pedido TIME NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT PK_pedidos PRIMARY KEY (id_pedido),
    CONSTRAINT FK_pedidos_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE detalles_pedidos (
    id_pedido INT NOT NULL,
    nro_linea INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_detalles_pedidos PRIMARY KEY (id_pedido, nro_linea),
    CONSTRAINT FK_detalles_pedidos_pedidos FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    CONSTRAINT FK_detalles_pedidos_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CONSTRAINT CK_detalles_cantidad CHECK (cantidad > 0),
    CONSTRAINT CK_detalles_precio CHECK (precio_unitario > 0)
);
GO

-- =========================================================
-- 2. INSERCION DE DATOS DE PRUEBA
-- =========================================================

INSERT INTO empleados (ci, primer_nombre, apellido, correo, fecha_ingreso) VALUES
('111101', 'Carlos', 'Mamani', 'carlos.m@elclub.com', '20230115'),
('111102', 'Roberto', 'Quinteros', 'roberto.q@elclub.com', '20230201'),
('111103', 'Valeria', 'Gutierrez', 'valeria.g@elclub.com', '20230310'),
('111104', 'Jorge', 'Siles', 'jorge.s@elclub.com', '20230405'),
('111105', 'Maria', 'Fernandez', 'maria.f@elclub.com', '20230512'),
('111106', 'Gonzalo', 'Morales', 'gonzalo.m@elclub.com', '20230620'),
('111107', 'Patricia', 'Suarez', 'patricia.s@elclub.com', '20230701'),
('111108', 'Fernando', 'Clarosa', 'fernando.c@elclub.com', '20230815'),
('111109', 'Daniela', 'Pardo', 'daniela.p@elclub.com', '20230901'),
('111110', 'Hugo', 'Navarro', 'hugo.n@elclub.com', '20231010'),
('111111', 'Lucia', 'Vargas', 'lucia.v@elclub.com', '20231105'),
('111112', 'Esteban', 'Rios', 'esteban.r@elclub.com', '20231201');

INSERT INTO duenos (id_empleado, nit, participacion_pct) VALUES
(1, '1020304050', 60.00),
(2, '1020304051', 40.00);

INSERT INTO empleados_comunes (id_empleado, cargo, sueldo) VALUES
(3, 'Recepcionista', 2800.00),
(4, 'Administrador de Mesas', 3200.00),
(5, 'Atencion al Cliente', 2500.00),
(6, 'Arbitro de Billar', 3000.00),
(7, 'Cajero', 2700.00),
(8, 'Soporte Tecnico', 3500.00),
(9, 'Recepcionista', 2800.00),
(10, 'Mantenimiento', 2400.00),
(11, 'Atencion al Cliente', 2500.00),
(12, 'Supervisora', 3800.00);

INSERT INTO telefonos_empleados (id_empleado, telefono) VALUES
(1, '70000001'), (2, '70000002'), (3, '70000003'), (4, '70000004'), (5, '70000005'),
(6, '70000006'), (7, '70000007'), (8, '70000008'), (9, '70000009'), (10, '70000010');

INSERT INTO clientes (ci, primer_nombre, apellido, correo, contrasena_hash, fecha_nacimiento) VALUES
('222201', 'Juan', 'Perez', 'juan.perez@gmail.com', 'hash_01', '19950312'),
('222202', 'Ana', 'Torres', 'ana.torres@gmail.com', 'hash_02', '19980724'),
('222203', 'Luis', 'Rojas', 'luis.rojas@gmail.com', 'hash_03', '19921105'),
('222204', 'Sofia', 'Mendoza', 'sofia.mendoza@gmail.com', 'hash_04', '20000118'),
('222205', 'Diego', 'Flores', 'diego.flores@gmail.com', 'hash_05', '19970930'),
('222206', 'Elena', 'Castro', 'elena.castro@gmail.com', 'hash_06', '19940514'),
('222207', 'Mateo', 'Gomez', 'mateo.gomez@gmail.com', 'hash_07', '20011201'),
('222208', 'Camila', 'Vargas', 'camila.vargas@gmail.com', 'hash_08', '19990822'),
('222209', 'Gabriel', 'Ortega', 'gabriel.ortega@gmail.com', 'hash_09', '19960410'),
('222210', 'Natalia', 'Espinosa', 'natalia.espinosa@gmail.com', 'hash_10', '20020228');

INSERT INTO telefonos_clientes (id_cliente, telefono) VALUES
(1, '60000001'), (2, '60000002'), (3, '60000003'), (4, '60000004'), (5, '60000005'),
(6, '60000006'), (7, '60000007'), (8, '60000008'), (9, '60000009'), (10, '60000010');

INSERT INTO mesas (numero, tipo, estado, tarifa_hora) VALUES
(1, 'Pool', 'Disponible', 25.00),
(2, 'Pool', 'Disponible', 25.00),
(3, 'Pool', 'Ocupada', 25.00),
(4, 'Tres Bandas', 'Disponible', 30.00),
(5, 'Tres Bandas', 'Disponible', 30.00),
(6, 'Snooker', 'Mantenimiento', 35.00),
(7, 'Snooker', 'Disponible', 35.00),
(8, 'Pool VIP', 'Disponible', 40.00),
(9, 'Pool VIP', 'Disponible', 40.00),
(10, 'Carambola', 'Disponible', 30.00);

INSERT INTO horarios (dia_semana, hora_apertura, hora_cierre, estado) VALUES
('Lunes', '14:00', '23:00', 'Activo'),
('Martes', '14:00', '23:00', 'Activo'),
('Miercoles', '14:00', '23:00', 'Activo'),
('Jueves', '14:00', '23:00', 'Activo'),
('Viernes', '14:00', '02:00', 'Activo'),
('Sabado', '12:00', '02:00', 'Activo'),
('Domingo', '12:00', '22:00', 'Activo'),
('Feriados', '15:00', '23:00', 'Especial'),
('Turno Mañana', '09:00', '13:00', 'Inactivo'),
('Turno Noche', '20:00', '03:00', 'Activo');

INSERT INTO mesas_horarios (id_mesa, id_horario) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2);

INSERT INTO reservas (id_cliente, id_mesa, id_empleado_comun, fecha_reserva, hora_inicio, hora_fin, estado, fecha_creacion) VALUES
(1, 1, 3, '20261020', '15:00', '17:00', 'Confirmada', GETDATE()),
(2, 2, 3, '20261020', '16:00', '18:00', 'Confirmada', GETDATE()),
(3, 3, 5, '20261021', '18:00', '20:00', 'Pendiente', GETDATE()),
(4, 4, 5, '20261021', '19:00', '21:00', 'Confirmada', GETDATE()),
(5, 5, 7, '20261022', '14:00', '16:00', 'Completada', GETDATE()),
(6, 6, 7, '20261022', '17:00', '19:00', 'Cancelada', GETDATE()),
(7, 7, 9, '20261023', '20:00', '22:00', 'Confirmada', GETDATE()),
(8, 8, 9, '20261023', '21:00', '23:00', 'Confirmada', GETDATE()),
(9, 9, 11, '20261024', '15:00', '18:00', 'Confirmada', GETDATE()),
(10, 10, 11, '20261024', '18:00', '20:00', 'Confirmada', GETDATE());

INSERT INTO usos_mesas (id_mesa, id_cliente, hora_inicio, hora_fin) VALUES
(1, 1, '20261015 15:00:00', '20261015 17:00:00'),
(2, 2, '20261015 16:00:00', '20261015 18:00:00'),
(3, 3, '20261016 18:00:00', '20261016 20:00:00'),
(4, 4, '20261016 19:00:00', '20261016 21:00:00'),
(5, 5, '20261017 14:00:00', '20261017 16:00:00'),
(6, 6, '20261017 17:00:00', '20261017 19:00:00'),
(7, 7, '20261018 20:00:00', '20261018 22:00:00'),
(8, 8, '20261018 21:00:00', '20261018 23:00:00'),
(9, 9, '20261019 15:00:00', '20261019 18:00:00'),
(10, 10, '20261019 18:00:00', '20261019 20:00:00');

INSERT INTO torneos (id_dueno, nombre, fecha_inicio, fecha_fin, premio_total, costo_inscripcion, estado) VALUES
(1, 'Torneo Apertura Pool', '20261101', '20261105', 2000.00, 50.00, 'Programado'),
(1, 'Copa Aniversario Tres Bandas', '20261110', '20261112', 1500.00, 40.00, 'Programado'),
(2, 'Liga Nocturna de Billar', '20261115', '20261215', 3000.00, 100.00, 'Inscripciones'),
(2, 'Master Snooker Club', '20261201', '20261203', 2500.00, 80.00, 'Programado'),
(1, 'Torneo Relampago Fin de Semana', '20261210', '20261211', 1000.00, 30.00, 'Programado'),
(2, 'Campeonato Clasico Bola 8', '20270105', '20270110', 1800.00, 45.00, 'Borrador'),
(1, 'Liga Verano Billar', '20270115', '20270228', 3500.00, 120.00, 'Borrador'),
(2, 'Torneo Estudiantil Billar', '20270201', '20270203', 800.00, 20.00, 'Borrador'),
(1, 'Copa de Campeones', '20270215', '20270220', 5000.00, 150.00, 'Borrador'),
(2, 'Torneo Principiantes Pool', '20270301', '20270302', 600.00, 25.00, 'Borrador');

INSERT INTO torneos_eliminatorios (id_torneo, nro_rondas, tipo_eliminacion) VALUES
(1, 4, 'Directa'),
(2, 3, 'Doble Eliminacion'),
(4, 4, 'Directa'),
(5, 3, 'Directa'),
(6, 4, 'Doble Eliminacion');

INSERT INTO torneos_liga (id_torneo, nro_jornadas, puntos_victoria) VALUES
(3, 10, 3),
(7, 12, 3);

INSERT INTO torneos_mesas (id_torneo, id_mesa) VALUES
(1, 1), (1, 2), (2, 4), (2, 5), (3, 1), (3, 2), (3, 3), (4, 6), (4, 7), (5, 8);

INSERT INTO partidas (id_uso, id_torneo, fecha, hora_inicio, hora_fin, modalidad, resultado, estado) VALUES
(1, 1, '20261101', '15:00', '16:00', 'Bola 8', 'Cliente 1 Gana', 'Finalizada'),
(2, 1, '20261101', '16:00', '17:00', 'Bola 8', 'Cliente 2 Gana', 'Finalizada'),
(3, 2, '20261110', '18:00', '19:00', 'Tres Bandas', 'Cliente 3 Gana', 'Finalizada'),
(4, 2, '20261110', '19:00', '20:00', 'Tres Bandas', 'Cliente 4 Gana', 'Finalizada'),
(5, 3, '20261115', '14:00', '15:00', 'Bola 9', 'Cliente 5 Gana', 'Finalizada'),
(6, 3, '20261115', '17:00', '18:00', 'Bola 9', 'Cliente 6 Gana', 'Finalizada'),
(7, NULL, '20261018', '20:00', '21:00', 'Amistoso Pool', 'Cliente 7 Gana', 'Finalizada'),
(8, NULL, '20261018', '21:00', '22:00', 'Amistoso Snooker', 'Cliente 8 Gana', 'Finalizada'),
(9, 4, '20261201', '15:00', '16:30', 'Snooker', 'Cliente 9 Gana', 'Finalizada'),
(10, 5, '20261210', '18:00', '19:00', 'Bola 8', 'Cliente 10 Gana', 'Finalizada');

INSERT INTO participaciones_partidas (id_cliente, id_partida) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

INSERT INTO inscripciones (id_cliente, id_torneo, fecha_inscripcion, estado_inscripcion) VALUES
(1, 1, '20261020', 'Confirmada'),
(2, 1, '20261020', 'Confirmada'),
(3, 2, '20261021', 'Confirmada'),
(4, 2, '20261021', 'Confirmada'),
(5, 3, '20261022', 'Pendiente'),
(6, 3, '20261022', 'Confirmada'),
(7, 4, '20261023', 'Confirmada'),
(8, 4, '20261023', 'Confirmada'),
(9, 5, '20261024', 'Confirmada'),
(10, 5, '20261024', 'Confirmada');

INSERT INTO pagos_inscripciones (id_inscripcion, monto, fecha_pago, metodo_pago, estado) VALUES
(1, 50.00, '20261020 10:30:00', 'QR', 'Aprobado'),
(2, 50.00, '20261020 11:15:00', 'Efectivo', 'Aprobado'),
(3, 40.00, '20261021 09:00:00', 'Tarjeta', 'Aprobado'),
(4, 40.00, '20261021 14:20:00', 'QR', 'Aprobado'),
(5, 100.00, '20261022 16:45:00', 'Transferencia', 'Pendiente'),
(6, 100.00, '20261022 18:00:00', 'Efectivo', 'Aprobado'),
(7, 80.00, '20261023 12:10:00', 'QR', 'Aprobado'),
(8, 80.00, '20261023 15:30:00', 'Tarjeta', 'Aprobado'),
(9, 30.00, '20261024 10:00:00', 'Efectivo', 'Aprobado'),
(10, 30.00, '20261024 11:30:00', 'QR', 'Aprobado');

INSERT INTO productos (nombre, descripcion, precio, stock, estado) VALUES
('Gaseosa 500ml', 'Bebida gaseosa en botella', 10.00, 50, 'Disponible'),
('Cerveza Personal', 'Cerveza rubia 330ml', 18.00, 60, 'Disponible'),
('Hamburguesa Clásica', 'Hamburguesa con carne y queso', 25.00, 30, 'Disponible'),
('Papas Fritas', 'Porción individual de papas', 15.00, 40, 'Disponible'),
('Agua Mineral 600ml', 'Agua sin gas', 7.00, 100, 'Disponible'),
('Pizza Familiar', 'Pizza muzzarella 8 porciones', 60.00, 15, 'Disponible'),
('Energizante', 'Lata 250ml', 20.00, 45, 'Disponible'),
('Sandwich de Pollo', 'Pan baguette con pollo desmenuzado', 18.00, 25, 'Disponible'),
('Jugo Natural', 'Vaso de jugo de fruta de temporada', 12.00, 30, 'Disponible'),
('Café Expreso', 'Taza de café cargado', 8.00, 50, 'Disponible');

INSERT INTO pedidos (id_cliente, fecha_pedido, hora_pedido, estado) VALUES
(1, '20261015', '15:30', 'Entregado'),
(2, '20261015', '16:45', 'Entregado'),
(3, '20261016', '18:15', 'Entregado'),
(4, '20261016', '19:30', 'Entregado'),
(5, '20261017', '14:20', 'Entregado'),
(6, '20261017', '17:40', 'Entregado'),
(7, '20261018', '20:10', 'En Proceso'),
(8, '20261018', '21:15', 'En Proceso'),
(9, '20261019', '15:45', 'Pendiente'),
(10, '20261019', '18:30', 'Pendiente');

INSERT INTO detalles_pedidos (id_pedido, nro_linea, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 2, 10.00),
(2, 1, 2, 3, 18.00),
(3, 1, 3, 1, 25.00),
(4, 1, 4, 2, 15.00),
(5, 1, 5, 1, 7.00),
(6, 1, 6, 1, 60.00),
(7, 1, 7, 2, 20.00),
(8, 1, 8, 1, 18.00),
(9, 1, 9, 2, 12.00),
(10, 1, 10, 1, 8.00);
GO
