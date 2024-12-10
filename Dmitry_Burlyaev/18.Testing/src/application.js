const express = require('express'); // Import Express
const app = express(); // Create the app
const PORT = 8080; // Define the port

// Define the default route
app.get('/', (req, res) => {
  res.send('Hello, World! This is a simple Node.js app.');
});

// Define a status route
app.get('/status', (req, res) => {
  res.json({
    status: 'ok',
    message: 'Application is running',
    version: '1.0.0',
    uptime: process.uptime(),
  });
});

// Define a test data route
app.get('/test-data', (req, res) => {
  res.json({
    message: 'Test data for validation',
    data: [
      { id: 1, name: 'Admin', role: 'Admin' },
      { id: 2, name: 'User', role: 'User' },
      { id: 3, name: 'Moderator', role: 'Moderator' },
    ],
  });
});

// Define a route to test headers and query parameters
app.get('/info', (req, res) => {
  const userAgent = req.headers['user-agent'];
  const queryParam = req.query.param || 'No parameter provided';
  res.json({
    message: 'Information endpoint',
    userAgent,
    queryParam,
  });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
