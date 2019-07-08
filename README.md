# django-celery-redis-docker

Test Django and Celery on Docker with Redis

### Tutorial

https://medium.com/@mdcg.dev/configurando-um-sistem-em-django-para-executar-tarefas-ass%C3%ADncronas-utilizando-celery-redis-e-53a30d0d2ec2

## Como rodar o projeto?

* Clone esse repositório.
* Crie um virtualenv com Python 3.
* Ative o virtualenv.
* Instale as dependências.
* Rode as migrações.

```
git clone https://github.com/rg3915/django-celery-redis-docker.git
cd django-celery-redis-docker
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python contrib/env_gen.py
python manage.py migrate
```

## Rodando o Celery

Abra outro terminal com o virtualenv ativado e digite

Dá pra fazer sem o `queue`.

```
celery --app=myproject worker --loglevel=INFO
```

Mas o `queue` define uma fila.

```
celery --app=myproject worker --loglevel=INFO --queue=fila1
```

### Instalando e configurando django-celery-results

https://django-celery-results.readthedocs.io/en/latest/

```
python manage.py migrate django_celery_results
```

Original Dockerfile

```
FROM python:3.7
ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1
COPY ./requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
COPY . /code/
WORKDIR /code/
EXPOSE 8000
```

