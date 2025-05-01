FROM python:3.11-slim

WORKDIR /app

COPY script.py .

RUN pip install sqlalchemy psycopg2-binary

CMD ["python", "script.py", "60"]
