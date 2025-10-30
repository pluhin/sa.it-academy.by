const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('<h1>Hello from Docker! 🐳</h1><p>Node.js app is running in container</p>');
});

app.listen(port, () => {
    console.log(`App running on http://localhost:${port}`);
});