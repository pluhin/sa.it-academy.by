from flask import Flask, request, jsonify
from datetime import datetime
from zoneinfo import ZoneInfo, ZoneInfoNotFoundError
import os
import MySQLdb

ENABLE_DB_LOGS = os.getenv("ENABLE_DB_LOGS", "0") in ('true', '1')

app = Flask(__name__)

DB_HOST = os.getenv("DB_HOST", "mysql")
DB_PORT = int(os.getenv("DB_PORT", "3306"))
DB_USER = os.getenv("DB_USER", "app")
DB_PASS = os.getenv("DB_PASS", "app_pass")
DB_NAME = os.getenv("DB_NAME", "appdb")

def get_conn():
    return MySQLdb.connect(
        host=DB_HOST,
        port=DB_PORT,
        user=DB_USER,
        passwd=DB_PASS,
        db=DB_NAME,
        charset="utf8mb4",
        autocommit=True,
    )


def init_db():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("""
      CREATE TABLE IF NOT EXISTS request_logs (
        id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
        ts_utc DATETIME NOT NULL,
        remote_addr VARCHAR(64) NULL,
        path VARCHAR(255) NOT NULL,
        query_string TEXT NULL,
        status_code INT NOT NULL
      ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    """)
    cur.close()
    conn.close()


def init_db_if_needed():
    if ENABLE_DB_LOGS:
        init_db()
        app.logger.info("DB logging enabled")
        return

    app.logger.info("DB logging disabled")
    return

def log_request(status_code: int, tz_name: str | None):
    if not ENABLE_DB_LOGS:
        return

    try:
        conn = get_conn()
        cur = conn.cursor()
        cur.execute(
            """
            INSERT INTO request_logs (ts_utc, remote_addr, path, query_string, status_code)
            VALUES (UTC_TIMESTAMP(), %s, %s, %s, %s)
            """,
            (
                request.remote_addr,
                request.path,
                request.query_string.decode("utf-8", errors="replace"),
                status_code,
            ),
        )
        cur.close()
        conn.close()
    except Exception as e:
        app.logger.exception("Failed to log request: %s", e)


@app.route("/time")
def get_time():
    tz_name = request.args.get("tz")

    if tz_name:
        try:
            tz = ZoneInfo(tz_name)
        except ZoneInfoNotFoundError:
            log_request(400, tz_name)
            return jsonify({"error": f"Unknown timezone: {tz_name}"}), 400
    else:
        tz = ZoneInfo("UTC")

    now = datetime.now(tz)
    resp = jsonify({
        "timezone": tz.key,
        "current_time": now.strftime("%Y-%m-%d %H:%M:%S")
    })
    log_request(200, tz_name)
    return resp

with app.app_context():
  init_db_if_needed()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=2222, debug=True)
