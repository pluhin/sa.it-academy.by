const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h1>Привет! Приложение успешно запущено в Docker-контейнере!</h1>');
});

app.listen(PORT, () => {
  console.log(`Сервер запущен на порту ${PORT}`);
});
