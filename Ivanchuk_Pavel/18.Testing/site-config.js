const http = require('http');
const fs = require('fs');
const path = require('path');

const port = process.env.PORT || 8080; 

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname,'site', req.url);
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(404, { 'Content-Type': 'text/html' });
      res.end('404 Not Found');
    } else {
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(data);
    }
  });
});

server.listen(port, () => {
  console.log(`Server was enabled in port ${port}`);
});
