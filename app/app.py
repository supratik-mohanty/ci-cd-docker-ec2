from flask import Flask, jsonify

app = Flask(__name__)   # <-- MUST be at top level

@app.route("/")
def home():
    return jsonify(
        status="ok",
        message="Hello from CI/CD pipeline!"
    )
