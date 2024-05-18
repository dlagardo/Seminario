create database seminario;

use seminario;

-- Crear la tabla tipo_usuario
CREATE TABLE tipo_usuarios (
    tipo_usuarios_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT
);

-- Crear la tabla tipo_usuario
CREATE TABLE `usuario` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `username` varchar(50) NOT NULL,
    `password` varchar(50) NOT NULL,
    `tipo_usuarios_id` INT, -- Agregar la columna tipo_usuarios_id
    FOREIGN KEY (tipo_usuarios_id) REFERENCES tipo_usuarios(tipo_usuarios_id) -- Referenciar correctamente la columna en tipo_usuarios
);

INSERT INTO `tipo_usuarios` (nombre, descripcion) VALUES ('Veterinario', 'General');
INSERT INTO `tipo_usuarios` (nombre, descripcion) VALUES ('Administrativo', 'Medio');

INSERT INTO usuario (username, password, tipo_usuarios_id) VALUES
('dario', '1234', 1),
('juan', '1234', 2);

select * from usuario;
SELECT usuario.username, tipo_usuarios.nombre AS tipo_usuario
FROM usuario
JOIN tipo_usuarios ON usuario.tipo_usuarios_id = tipo_usuarios.tipo_usuarios_id;

-- tabla cliente
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL UNIQUE,
    domicilio VARCHAR(255) NOT NULL
);

-- tabla mascota
CREATE TABLE mascota (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Insertar valores en la tabla cliente
INSERT INTO cliente (nombre, dni, domicilio) VALUES
('Juan Pérez', '12345678A', 'Calle Falsa 123'),
('María López', '87654321B', 'Avenida Siempreviva 742'),
('Carlos García', '11223344C', 'Calle del Sol 456');

-- Insertar valores en la tabla mascota
INSERT INTO mascota (tipo, nombre, edad, cliente_id) VALUES
('Perro', 'Rex', 5, 1),
('Gato', 'Miau', 3, 2),
('Perro', 'Bobby', 2, 1),
('Pez', 'Nemo', 1, 3);

-- Consulta para obtener una mascota con la información de su cliente
SELECT 
    mascota.nombre AS nombre_mascota, 
    mascota.tipo, 
    mascota.edad, 
    cliente.nombre AS nombre_cliente, 
    cliente.dni, 
    cliente.domicilio
FROM 
    mascota
JOIN 
    cliente ON mascota.cliente_id = cliente.id
WHERE 
    mascota.nombre = 'Rex';
    
    -- Crear la tabla articulo_veterinario
CREATE TABLE articulo_veterinario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    UNIQUE KEY (nombre) -- Asegurar que los nombres de los artículos sean únicos
);

-- Insertar valores de ejemplo en la tabla articulo_veterinario
INSERT INTO articulo_veterinario (nombre, descripcion) VALUES
('Vacuna para perros', 'Vacuna para prevenir enfermedades en perros'),
('Collar antipulgas', 'Collar para prevenir infestaciones de pulgas en perros y gatos'),
('Alimento para gatos', 'Alimento balanceado para gatos adultos');
select * from articulo_veterinario;

-- Crear la tabla inventario_veterinario
CREATE TABLE inventario_veterinario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    articulo_id INT,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    FOREIGN KEY (articulo_id) REFERENCES articulo_veterinario(id),
	FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Insertar valores de ejemplo en la tabla inventario_veterinario
INSERT INTO inventario_veterinario (articulo_id, cantidad, precio, fecha_ingreso) VALUES
(1, 100, 50.00, '2023-05-01',1), -- Vacuna para perros
(2, 200, 15.00, '2023-04-15',2), -- Collar antipulgas
(3, 50, 30.00, '2023-03-20',1);  -- Alimento para gatos

SELECT 
    inventario_veterinario.id AS id_inventario,
	articulo_veterinario.id AS id_articulo,
    articulo_veterinario.nombre AS nombre_articulo,
    articulo_veterinario.descripcion AS descripcion_articulo,
    inventario_veterinario.cantidad,
    inventario_veterinario.precio,
    inventario_veterinario.fecha_ingreso
FROM 
    inventario_veterinario
JOIN 
    articulo_veterinario ON inventario_veterinario.articulo_id = articulo_veterinario.id;

    
CREATE TABLE historia_clinica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    descripcion TEXT,
    mascota_id INT,
    cliente_id INT,
    usuario_id INT,
    FOREIGN KEY (mascota_id) REFERENCES mascota(id),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

-- Insertar valores de ejemplo en la tabla historia_clinica
INSERT INTO historia_clinica (fecha, descripcion, mascota_id, cliente_id, usuario_id) VALUES
('2024-05-18', 'Consulta de rutina', 1, 1, 1),
('2024-05-19', 'Vacunación anual', 2, 2, 2);


-- Mostrar la tabla historia_clinica
SELECT * FROM historia_clinica;
select * from mascota;
select * from usuario;
select * from cliente;



