import os
import socket
import platform
import time
import psycopg2
import redis
from flask import Flask, jsonify

app = Flask(__name__)


def get_db():
    return psycopg2.connect(
        host=os.environ["DB_HOST"],
        port=os.environ.get("DB_PORT", 5432),
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
    )

def get_redis():
    return redis.Redis(
        host=os.environ.get("REDIS_HOST", "redis"),
        port=int(os.environ.get("REDIS_PORT", 6379)),
        decode_responses=True,
    )

def init_db():
    """Create visits table if it doesn't exist."""
    conn = get_db()
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS visits (
            id        SERIAL PRIMARY KEY,
            path      TEXT        NOT NULL,
            visited_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
        )
    """)
    conn.commit()
    cur.close()
    conn.close()

for attempt in range(10):
    try:
        init_db()
        print("DB initialised")
        break
    except Exception as e:
        print(f"DB not ready ({e}), retrying in 2s … [{attempt+1}/10]")
        time.sleep(2)


@app.route("/")
def index():
    try:
        conn = get_db()
        cur = conn.cursor()
        cur.execute("INSERT INTO visits (path) VALUES ('/') RETURNING id")
        visit_id = cur.fetchone()[0]
        cur.execute("SELECT COUNT(*) FROM visits WHERE path = '/'")
        total = cur.fetchone()[0]
        conn.commit()
        cur.close()
        conn.close()
        db_status = f"✅ connected (visit #{visit_id}, total: {total})"
    except Exception as e:
        db_status = f"❌ {e}"
        total = "?"

    try:
        r = get_redis()
        page_views = r.incr("page_views")
        redis_status = f"✅ connected (global views: {page_views})"
    except Exception as e:
        redis_status = f"❌ {e}"
        page_views = "?"

    return f"""<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <title>Flask + Postgres + Redis</title>
  <style>
    *{{box-sizing:border-box;margin:0;padding:0}}
    body{{font-family:'Segoe UI',system-ui,sans-serif;background:#0f172a;color:#e2e8f0;
         display:flex;align-items:center;justify-content:center;min-height:100vh}}
    .card{{background:#1e293b;border:1px solid #334155;border-radius:12px;
           padding:2.5rem 3rem;width:520px;box-shadow:0 20px 40px rgba(0,0,0,.4)}}
    .badge{{display:inline-block;background:#0ea5e9;color:#fff;font-size:.72rem;
            font-weight:700;letter-spacing:.08em;text-transform:uppercase;
            padding:.25rem .75rem;border-radius:999px;margin-bottom:1.25rem}}
    h1{{font-size:1.4rem;margin-bottom:1.5rem;color:#f1f5f9}}
    h2{{font-size:.8rem;text-transform:uppercase;letter-spacing:.1em;color:#64748b;
        margin:1.2rem 0 .5rem}}
    table{{width:100%;border-collapse:collapse;font-size:.88rem}}
    td{{padding:.5rem .4rem;border-bottom:1px solid #334155}}
    td:first-child{{color:#94a3b8;width:42%}}
    td:last-child{{font-family:monospace;color:#38bdf8;word-break:break-all}}
    .footer{{margin-top:1.25rem;font-size:.75rem;color:#475569;text-align:right}}
  </style>
</head>
<body>
  <div class="card">
    <span class="badge">🐳 Docker Compose Stack</span>
    <h1>Flask · PostgreSQL · Redis</h1>

    <h2>Container</h2>
    <table>
      <tr><td>Hostname</td>     <td>{socket.gethostname()}</td></tr>
      <tr><td>Python</td>       <td>{platform.python_version()}</td></tr>
      <tr><td>APP_ENV</td>      <td>{os.environ.get("APP_ENV","not set")}</td></tr>
      <tr><td>AUTHOR</td>       <td>{os.environ.get("AUTHOR","not set")}</td></tr>
    </table>

    <h2>PostgreSQL</h2>
    <table>
      <tr><td>Host</td>         <td>{os.environ.get("DB_HOST","—")}</td></tr>
      <tr><td>Database</td>     <td>{os.environ.get("DB_NAME","—")}</td></tr>
      <tr><td>Status</td>       <td>{db_status}</td></tr>
    </table>

    <h2>Redis</h2>
    <table>
      <tr><td>Host</td>         <td>{os.environ.get("REDIS_HOST","—")}</td></tr>
      <tr><td>Status</td>       <td>{redis_status}</td></tr>
      <tr><td>Page views</td>   <td>{page_views}</td></tr>
    </table>

    <div class="footer">Flask {__import__("flask").__version__} · Port {os.environ.get("PORT","5000")}</div>
  </div>
</body>
</html>"""


@app.route("/health")
def health():
    checks = {}
    # postgres
    try:
        conn = get_db(); conn.close()
        checks["postgres"] = "ok"
    except Exception as e:
        checks["postgres"] = str(e)
    # redis
    try:
        get_redis().ping()
        checks["redis"] = "ok"
    except Exception as e:
        checks["redis"] = str(e)

    ok = all(v == "ok" for v in checks.values())
    return jsonify(status="ok" if ok else "degraded",
                   hostname=socket.gethostname(),
                   checks=checks), 200 if ok else 503


@app.route("/visits")
def visits():
    try:
        conn = get_db()
        cur = conn.cursor()
        cur.execute("SELECT path, visited_at FROM visits ORDER BY visited_at DESC LIMIT 20")
        rows = [{"path": r[0], "visited_at": r[1].isoformat()} for r in cur.fetchall()]
        cur.close(); conn.close()
        return jsonify(visits=rows)
    except Exception as e:
        return jsonify(error=str(e)), 500


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
