const express = require('express');
const router = express.Router();
const db = require('../config/database.js');

// GET: Obtener todos los maestros
router.get('/', (req, res) => {
    db.query('SELECT * FROM maestros', (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Error al obtener maestros' });
        } else {
            res.json(results);
        }
    });
});

// POST: Crear un nuevo maestro
router.post('/', (req, res) => {
    const { nombre, edad, telefono, correo, usuario_creacion } = req.body;

    if (!nombre || !edad || !telefono || !correo || !usuario_creacion) {
        return res.status(400).json({ error: 'Todos los campos son obligatorios.' });
    }

    const query = `
        INSERT INTO maestros (nombre, edad, telefono, correo, usuario_creacion, fecha_creacion) 
        VALUES (?, ?, ?, ?, ?, NOW())
    `;

    db.query(query, [nombre, edad, telefono, correo, usuario_creacion], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).json({ error: 'Error al crear maestro' });
        } else {
            res.status(201).json({ id: result.insertId });
        }
    });
});


module.exports = router;
