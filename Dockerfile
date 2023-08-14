FROM python:3.8.0-alpine3.10

COPY wait-for-django.sh /app/wait-for-django.sh
RUN chmod +x /app/wait-for-django.sh


WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update \
    && apk add --no-cache gcc musl-dev postgresql-dev python3-dev libffi-dev mariadb-connector-c-dev \
    && pip install --upgrade pip

COPY ./requirements.txt ./

RUN pip install -r requirements.txt

COPY ./ ./

CMD ["./wait-for-django.sh", "mysql-recetas", "python","manage.py","runserver","0.0.0.0:8000"]