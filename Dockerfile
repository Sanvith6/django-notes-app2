FROM python:3.9

WORKDIR /app/backend

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && pip install --upgrade pip \
    && pip install mysqlclient \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
