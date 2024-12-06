const express = require('express');
const app = express();
const port = 3000;

// Primera Prueba
app.get('/', (req, res) => {
  res.send('¡Hola Mundo prueba!');
});

// Hacer que el servidor escuche en el puerto 3000
app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
