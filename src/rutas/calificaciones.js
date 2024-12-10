const express = require('express');
const router = express.Router();
const db = require('../config/database.js');

// GET: Obtener todas las calificaciones
router.get('/', (req, res) => {
    const query = `
        SELECT 
            calificaciones.id,
            estudiantes.nombre AS estudiante,
            maestros.nombre AS maestro,
            materias.nombre AS materia,
            calificaciones.usuario_creacion,
            calificaciones.fecha_creacion
        FROM calificaciones
        INNER JOIN estudiantes ON calificaciones.estudiante_id = estudiantes.id
        INNER JOIN maestros ON calificaciones.maestro_id = maestros.id
        INNER JOIN materias ON calificaciones.materia_id = materias.id
    `;

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Error al obtener calificaciones' });
        } else {
            res.json(results);
        }
    });
});

// POST: Crear una nueva calificación
router.post('/', (req, res) => {
    const { estudiante_id, maestro_id, materia_id, usuario_creacion } = req.body;

    if (!estudiante_id || !maestro_id || !materia_id || !usuario_creacion) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios.' });
    }

    const query = `
        INSERT INTO calificaciones (estudiante_id, maestro_id, materia_id, usuario_creacion, fecha_creacion)
        VALUES (?, ?, ?, ?, NOW())
    `;

    db.query(query, [estudiante_id, maestro_id, materia_id, usuario_creacion], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Error al crear calificación' });
        } else {
            res.status(201).json({ id: result.insertId });
        }
    });
});

module.exports = router;
