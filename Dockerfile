FROM python:3.8.0-alpine3.10


COPY wait-for.sh /app/wait-for.sh

RUN chmod +x /app/wait-for.sh
RUN chown root:root /app/wait-for.sh

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

CMD ["./wait-for.sh", "mysql-recetas", "python","manage.py","runserver","0.0.0.0:8000"]