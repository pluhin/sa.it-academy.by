const express = require('express');
const routes = require('./routes');

const app = express();

const PORT = process.env.EXPRESS_PORT;

app.use('/', routes);

app.listen(PORT, function () {
  console.log(`NodeJs express is listening on port: ${PORT}`);
});
