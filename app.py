"""
Simple Flask application used to demonstrate containerization,
CI/CD, and cloud deployment in this DevOps portfolio project.
"""
from flask import Flask, jsonify
import socket
import os
import datetime

app = Flask(__name__)


@app.route("/")
def home():
    return jsonify({
        "message": "Hello from the DevOps & Cloud Portfolio App!",
        "hostname": socket.gethostname(),
        "environment": os.getenv("APP_ENV", "development"),
        "timestamp": datetime.datetime.utcnow().isoformat() + "Z"
    })


@app.route("/health")
def health():
    """Health check endpoint used by Docker HEALTHCHECK, load balancers,
    and CloudWatch/monitoring probes."""
    return jsonify({"status": "healthy"}), 200


@app.route("/version")
def version():
    return jsonify({"version": os.getenv("APP_VERSION", "1.0.0")})


if __name__ == "__main__":
    port = int(os.getenv("PORT", 5000))
    app.run(host="0.0.0.0", port=port)
