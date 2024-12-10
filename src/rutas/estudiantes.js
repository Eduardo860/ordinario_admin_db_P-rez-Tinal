const express = require('express');
const router = express.Router();
const db = require('../config/database.js');

// GET: Obtener todos los estudiantes
router.get('/', (req, res) => {
    db.query('SELECT * FROM estudiantes', (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Error al obtener estudiantes' });
        } else {
            res.json(results);
        }
    });
});

// POST: Crear un nuevo estudiante
router.post('/', (req, res) => {
    const { nombre, apellidos, email, matricula, edad, semestre } = req.body;

    if (!nombre || !apellidos || !email || !matricula || !edad || !semestre) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios' });
    }

    const query = `
        INSERT INTO estudiantes (nombre, apellidos, email, matricula, edad, semestre) 
        VALUES (?, ?, ?, ?, ?, ?)
    `;
    db.query(query, [nombre, apellidos, email, matricula, edad, semestre], (err, result) => {
        if (err) {
            res.status(500).json({ error: 'Error al crear estudiante' });
        } else {
            res.status(201).json({ id: result.insertId });
        }
    });
});

module.exports = router;
