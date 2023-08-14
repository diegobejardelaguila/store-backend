# Instalación

```bash
git clone https://github.com/diegobejardelaguila/asistencia-backend.git
```

2. Crea un archivo .env basado en el archivo .env_example, tanto para docker como para el backend:
```bash
cp .env_example .env
```
```bash
 cp core/.env_example core/.env
```

3. Crea un archivo .env basado en el archivo .env_example, tanto para docker como para el backend:
```bash
 docker-compose up
```
3. Ingresa a tu contenedor y realiza las migraciones:
```bash
 docker exec -it django-android sh
```

```bash
 python manage.py makemigrations user
```

```bash
 python manage.py migrate user
```

```bash
 python manage.py migrate
```
4. Podras visualizar tu backend en localhost:8000
