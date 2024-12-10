const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();

const app = express();
app.use(express.json());


// Importar rutas
const estudiantesRoutes = require('./rutas/estudiantes');
const maestrosRoutes = require('./rutas/maestros');



// Registrar rutas
app.use('/api/estudiantes', estudiantesRoutes);
app.use('/api/maestros', maestrosRoutes);



// Endpoint de prueba
app.get('/', (req, res) => {
    res.send('¡Hola Mundo!');
});

// Escuchar en el puerto especificado en .env
app.listen(process.env.PORT, () => {
    console.log(`Servidor escuchando en http://localhost:${process.env.PORT}`);
});