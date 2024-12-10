USE ordinario_modelo_admin;

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