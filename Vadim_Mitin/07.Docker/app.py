import os
import socket
import platform
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Flask Docker App</title>
  <style>
    * {{ box-sizing: border-box; margin: 0; padding: 0; }}
    body {{
      font-family: 'Segoe UI', system-ui, sans-serif;
      background: #0f172a;
      color: #e2e8f0;
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
    }}
    .card {{
      background: #1e293b;
      border: 1px solid #334155;
      border-radius: 12px;
      padding: 2.5rem 3rem;
      width: 480px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.4);
    }}
    .badge {{
      display: inline-block;
      background: #0ea5e9;
      color: #fff;
      font-size: 0.72rem;
      font-weight: 700;
      letter-spacing: .08em;
      text-transform: uppercase;
      padding: .25rem .75rem;
      border-radius: 999px;
      margin-bottom: 1.25rem;
    }}
    h1 {{ font-size: 1.5rem; margin-bottom: 1.5rem; color: #f1f5f9; }}
    table {{ width: 100%; border-collapse: collapse; font-size: .9rem; }}
    td {{ padding: .55rem .4rem; border-bottom: 1px solid #334155; }}
    td:first-child {{ color: #94a3b8; width: 40%; }}
    td:last-child  {{ font-family: monospace; color: #38bdf8; }}
    .footer {{ margin-top: 1.25rem; font-size: .78rem; color: #475569; text-align: right; }}
  </style>
</head>
<body>
  <div class="card">
    <span class="badge">🐳 Running in Docker</span>
    <h1>Flask Web Application</h1>
    <table>
      <tr><td>Hostname</td>      <td>{socket.gethostname()}</td></tr>
      <tr><td>IP Address</td>    <td>{socket.gethostbyname(socket.gethostname())}</td></tr>
      <tr><td>Python</td>        <td>{platform.python_version()}</td></tr>
      <tr><td>OS</td>            <td>{platform.system()} {platform.release()}</td></tr>
      <tr><td>APP_ENV</td>       <td>{os.environ.get("APP_ENV", "not set")}</td></tr>
      <tr><td>AUTHOR</td>        <td>{os.environ.get("AUTHOR", "not set")}</td></tr>
    </table>
    <div class="footer">Flask {__import__("flask").__version__} · Port {os.environ.get("PORT", "5000")}</div>
  </div>
</body>
</html>"""

@app.route("/health")
def health():
    return jsonify(status="ok", hostname=socket.gethostname())

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
