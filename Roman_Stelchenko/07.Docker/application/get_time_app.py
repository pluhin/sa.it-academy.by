from flask import Flask, request, jsonify
from datetime import datetime
from zoneinfo import ZoneInfo, ZoneInfoNotFoundError

app = Flask(__name__)

@app.route("/time")
def get_time():
    tz_name = request.args.get("tz")

    if tz_name:
        try:
            tz = ZoneInfo(tz_name)
        except ZoneInfoNotFoundError:
            return jsonify({"error": f"Unknown timezone: {tz_name}"}), 400
    else:
        tz = ZoneInfo("UTC")

    now = datetime.now(tz)

    return jsonify({
        "timezone": tz.key,
        "current_time": now.strftime("%Y-%m-%d %H:%M:%S")
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=2222, debug=True)
