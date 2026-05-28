const express = require('express');
const os = require('os');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    const containerId = os.hostname();
    res.send(`
        <!DOCTYPE html>
        <html>
        <head>
            <title>Docker Node.js App</title>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    margin: 0;
                    padding: 50px;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    min-height: 100vh;
                }
                .container {
                    background: white;
                    border-radius: 10px;
                    padding: 40px;
                    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
                    max-width: 600px;
                    margin: 0 auto;
                }
                h1 { color: #667eea; }
                .info {
                    background: #f5f5f5;
                    padding: 20px;
                    border-radius: 5px;
                    margin: 20px 0;
                }
                .label {
                    font-weight: bold;
                    color: #667eea;
                }
                .success {
                    color: #10b981;
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🚀 Docker Node.js Application</h1>
                <div class="info">
                    <p><span class="label">Container ID:</span> ${containerId}</p>
                    <p><span class="label">Message:</span> Hello from Docker!</p>
                    <p><span class="label">Node.js Version:</span> ${process.version}</p>
                    <p><span class="label">Platform:</span> ${process.platform}</p>
                </div>
                <p><span class="success">✅ Node.js app is running inside Docker container!</span></p>
            </div>
        </body>
        </html>
    `);
});

app.get('/health', (req, res) => {
    res.json({
        status: 'healthy',
        container: os.hostname(),
        timestamp: new Date().toISOString()
    });
});

app.listen(PORT, () => {
    console.log(`✅ Server running on http://localhost:${PORT}`);
    console.log(`📦 Container ID: ${os.hostname()}`);
});

module.exports = app;