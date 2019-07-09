FROM python:3.7
ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1
RUN mkdir /app
WORKDIR app/
ADD . .
RUN pip install -r requirements.txt
EXPOSE 8000
RUN python manage.py migrate
CMD gunicorn --reload myproject.wsgi:application -b 0.0.0.0:8000
