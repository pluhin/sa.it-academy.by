const express = require('express');
const app = express();

const PORT = 8080;

app.get('/', function (req, res) {
  res.send('My nodeJs express App in Docker!');
});

app.listen(PORT, function () {
  console.log(`NodeJs express is listening on port: ${PORT}`);
});
