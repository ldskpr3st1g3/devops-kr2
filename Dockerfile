FROM python:3.12-slim

WORKDIR /app

RUN groupadd -r appuser && useradd -r -g appuser -s /sbin/nologin appuser

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

USER appuser

EXPOSE 8002
CMD ["gunicorn", "--bind", "0.0.0.0:8002", "app:app"]
