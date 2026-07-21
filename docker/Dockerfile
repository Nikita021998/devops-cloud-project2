# ---------- Build stage ----------
FROM python:3.12-slim AS builder

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# ---------- Final stage ----------
FROM python:3.12-slim

# Create a non-root user for security best practices
RUN useradd --create-home appuser
WORKDIR /app

# Copy installed packages from builder stage
COPY --from=builder /root/.local /home/appuser/.local
COPY app/ .

ENV PATH=/home/appuser/.local/bin:$PATH \
    APP_ENV=production \
    PORT=5000

USER appuser

EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:5000/health')" || exit 1

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
