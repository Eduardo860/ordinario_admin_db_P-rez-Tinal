USE ordinario_modelo_admin;

USE ordinario_modelo_admin;


CREATE TABLE estudiantes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  apellidos VARCHAR(200) NOT NULL,
  email VARCHAR(100) NOT NULL,
  matricula VARCHAR(100) NOT NULL,
  edad INT NOT NULL,
  semestre VARCHAR(100) NOT NULL,
  usuario_creacion VARCHAR(100) NOT NULL,
  fecha_creacion DATETIME NOT NULL
);

CREATE TABLE maestros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  edad INT NOT NULL,
  telefono BIGINT NOT NULL,
  correo VARCHAR(150) NOT NULL,
  usuario_creacion VARCHAR(100) NOT NULL,
  fecha_creacion DATETIME NOT NULL
);

CREATE TABLE materias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  profesor_id INT NOT NULL,
  usuario_creacion VARCHAR(100) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  FOREIGN KEY (profesor_id) REFERENCES maestros(id)
);


CREATE TABLE calificaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudiante_id INT NOT NULL,
  maestro_id INT NOT NULL,
  materia_id INT NOT NULL,
  usuario_creacion VARCHAR(100) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
  FOREIGN KEY (maestro_id) REFERENCES maestros(id),
  FOREIGN KEY (materia_id) REFERENCES materias(id)
);


CREATE TABLE calificaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  estudiante_id INT NOT NULL,
  maestro_id INT NOT NULL,
  materia_id INT NOT NULL,
  usuario_creacion VARCHAR(100) NOT NULL,
  fecha_creacion DATETIME NOT NULL,
  FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
  FOREIGN KEY (maestro_id) REFERENCES maestros(id),
  FOREIGN KEY (materia_id) REFERENCES materias(id)
);

INSERT INTO estudiantes (nombre, apellidos, email, matricula, edad, semestre, usuario_creacion, fecha_creacion)
VALUES 
('Juan', 'Perez', 'juan.perez@example.com', 'A12345', 20, 'Segundo', 'admin', NOW()),
('Maria', 'Lopez', 'maria.lopez@example.com', 'B67890', 22, 'Cuarto', 'admin', NOW()),
('Carlos', 'Ramirez', 'carlos.ramirez@example.com', 'C11223', 19, 'Primero', 'admin', NOW()),
('Ana', 'Gonzalez', 'ana.gonzalez@example.com', 'D44556', 21, 'Tercero', 'admin', NOW()),
('Luis', 'Martinez', 'luis.martinez@example.com', 'E77889', 23, 'Quinto', 'admin', NOW());

INSERT INTO maestros (nombre, edad, telefono, correo, usuario_creacion, fecha_creacion)
VALUES
('Profesor 1', 45, 5551234567, 'prof1@example.com', 'admin', NOW()),
('Profesor 2', 50, 5559876543, 'prof2@example.com', 'admin', NOW()),
('Profesor 3', 38, 5554567890, 'prof3@example.com', 'admin', NOW()),
('Profesor 4', 42, 5553216548, 'prof4@example.com', 'admin', NOW()),
('Profesor 5', 36, 5556549871, 'prof5@example.com', 'admin', NOW());

INSERT INTO materias (nombre, profesor_id, usuario_creacion, fecha_creacion)
VALUES
('Matemáticas', 1, 'admin', NOW()),
('Física', 2, 'admin', NOW()),
('Química', 3, 'admin', NOW()),
('Historia', 4, 'admin', NOW()),
('Biología', 5, 'admin', NOW());

INSERT INTO calificaciones (estudiante_id, maestro_id, materia_id, usuario_creacion, fecha_creacion)
VALUES
(1, 1, 1, 'admin', NOW()),
(2, 2, 2, 'admin', NOW()),
(3, 3, 3, 'admin', NOW()),
(4, 4, 4, 'admin', NOW()),
(5, 5, 5, 'admin', NOW());