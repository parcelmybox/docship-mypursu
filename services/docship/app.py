from flask import Flask, request, jsonify
import re

app = Flask(__name__)

def validate_shipment_string(s: str):
    if s is None:
        return False, "missing string"
    s = s.strip()
    if not s:
        return False, "empty string"
    if len(s) < 5:
        return False, "too short (min 5 chars)"
    if len(s) > 200:
        return False, "too long (max 200 chars)"
    if not re.match(r'^[\w\s\-\_]+$', s):
        return False, "contains invalid characters (allowed: letters, numbers, _, -, space)"
    return True, None

@app.route("/ship_validate", methods=["POST"])
def ship_validate():
    # Accept JSON body { "shipment": "..." } or form field 'shipment' or query param
    payload = request.get_json(silent=True) or {}
    value = payload.get("shipment") or request.form.get("shipment") or request.args.get("shipment")
    valid, reason = validate_shipment_string(value)
    if valid:
        return jsonify(status="valid"), 200
    return jsonify(status="invalid", reason=reason), 400

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)