
FROM python:3.8-slim-buster
WORKDIR /app

COPY . /app

RUN apt update -y && apt install -y --no-install-recommends gcc

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8080", "app:app"]
