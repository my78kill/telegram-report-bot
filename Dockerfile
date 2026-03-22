# Build stage
FROM python:3.12-slim AS builder

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.12-slim

WORKDIR /app

# Copy installed packages
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

# Copy project files
COPY . .

# Env
ENV PYTHONPATH=/usr/local/lib/python3.12/site-packages
ENV PORT=10000

# Start Flask app
CMD ["python", "app.py"]
