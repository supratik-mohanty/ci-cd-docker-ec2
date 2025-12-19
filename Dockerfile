FROM python:3.11-slim

# Install curl for healthcheck
RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ /app

EXPOSE 5000

HEALTHCHECK --interval=10s --timeout=3s --retries=3 \
CMD curl -f http://127.0.0.1:5000/ || exit 1

# Run app with Gunicorn (production server)
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
