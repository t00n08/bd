-- Creación de la base de datos
CREATE DATABASE ejemploSelect;
USE ejemploSelect;

-- Tabla: tipo_usuarios
CREATE TABLE tipo_usuarios (
    id_tipo INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    nombre_tipo VARCHAR(50) NOT NULL, 
    descripcion_tipo VARCHAR(200) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP NULL
    );


-- Tabla: usuarios (se añade campo created_at con valor por defecto)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_tipo_usuario INT,
    CHECK (id_tipo_usuario > 0),
    CONSTRAINT fk_usuarios_tipo_usuarios FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuarios(id_tipo),
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP NULL
);


-- Tabla: ciudad (nueva)
CREATE TABLE ciudad (
    id_ciudad INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre_ciudad VARCHAR(100) NOT NULL,
    region VARCHAR(100),
    CHECK (nombre_ciudad <> ''),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP NULL
 );


-- Tabla: personas (relacionada con usuarios y ciudad)
CREATE TABLE personas (
    rut VARCHAR(13) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    fecha_nac DATE,
    id_usuario INT,
    id_ciudad INT,
    CONSTRAINT fk_personas_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    CONSTRAINT fk_personas_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP NULL
    );
    
    -- Poblar tabla tipo_usuarios
INSERT INTO tipo_usuarios (nombre_tipo, descripcion_tipo) VALUES
('Administrador', 'Acceso completo al sistema'),
('Cliente', 'Usuario con acceso restringido'),
('Moderador', 'Puede revisar y aprobar contenido');

-- Poblar tabla usuarios
INSERT INTO usuarios (username, password, email, id_tipo_usuario) VALUES
('admin01', 'pass1234', 'admin01@mail.com', 1),
('jvaldes', 'abc123', 'jvaldes@mail.com', 2),
('cmorales', '123456', 'cmorales@mail.com', 3),
('anavarro', 'pass4321', 'anavarro@mail.com', 2),
('rquezada', 'clave2023', 'rquezada@mail.com', 1),
('pgodoy', 'segura123', 'pgodoy@mail.com', 2),
('mdiaz', 'token456', 'mdiaz@mail.com', 3),
('scarvajal', 'azul789', 'scarvajal@mail.com', 2),
('ltapia', 'lt123', 'ltapia@mail.com', 3),
('afarias', 'afpass', 'afarias@mail.com', 2);

-- Poblar tabla ciudad
INSERT INTO ciudad (nombre_ciudad, region) VALUES
('Santiago', 'Región Metropolitana'),
('Valparaíso', 'Región de Valparaíso'),
('Concepción', 'Región del Biobío'),
('La Serena', 'Región de Coquimbo'),
('Puerto Montt', 'Región de Los Lagos');

-- Poblar tabla personas (relacionadas con usuarios y ciudades)
INSERT INTO personas (rut, nombre_completo, fecha_nac, id_usuario, id_ciudad) VALUES
('11.111.111-1', 'Juan Valdés', '1990-04-12', 2, 1),
('22.222.222-2', 'Camila Morales', '1985-09-25', 3, 2),
('33.333.333-3', 'Andrea Navarro', '1992-11-03', 4, 3),
('44.444.444-4', 'Rodrigo Quezada', '1980-06-17', 5, 1),
('55.555.555-5', 'Patricio Godoy', '1998-12-01', 6, 4),
('66.666.666-6', 'María Díaz', '1987-07-14', 7, 5),
('77.777.777-7', 'Sebastián Carvajal', '1993-03-22', 8, 2),
('88.888.888-8', 'Lorena Tapia', '2000-10-10', 9, 3),
('99.999.999-9', 'Ana Farías', '1995-01-28', 10, 4),
('10.101.010-0', 'Carlos Soto', '1991-08-08', 1, 1); -- admin01







