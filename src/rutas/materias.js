const express = require('express');
const router = express.Router();
const db = require('../config/database.js');

// GET: Obtener todas las materias
router.get('/', (req, res) => {
    const query = `
        SELECT materias.id, materias.nombre, maestros.nombre AS profesor, materias.usuario_creacion, materias.fecha_creacion
        FROM materias
        INNER JOIN maestros ON materias.profesor_id = maestros.id
    `;

    db.query(query, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Error al obtener materias' });
        } else {
            res.json(results);
        }
    });
});

// POST: Crear una nueva materia
router.post('/', (req, res) => {
    const { nombre, profesor_id, usuario_creacion } = req.body;

    if (!nombre || !profesor_id || !usuario_creacion) {
        return res.status(400).json({ error: 'Los campos nombre, profesor_id y usuario_creacion son obligatorios.' });
    }

    const query = `
        INSERT INTO materias (nombre, profesor_id, usuario_creacion, fecha_creacion)
        VALUES (?, ?, ?, NOW())
    `;

    db.query(query, [nombre, profesor_id, usuario_creacion], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Error al crear materia' });
        } else {
            res.status(201).json({ id: result.insertId });
        }
    });
});

module.exports = router;
