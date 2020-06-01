# fullstack-django-vuejs

This is a Fullstack test project, and use.

* [Ansible](https://docs.ansible.com/ansible/latest/index.html)
* [Docker](https://docs.docker.com/get-started/)
* [Swarm](https://docs.docker.com/engine/swarm/)
* [Django 2.2.12](https://docs.djangoproject.com/en/2.2/)
* [VueJS](https://vuejs.org/v2/guide/)
* [Nginx](https://nginx.org/en/docs/)
* [PostgreSQL](https://www.postgresql.org/docs/)
* [Celery](https://docs.celeryproject.org/en/stable/getting-started/introduction.html)
* [Redis](https://redis.io/documentation)
* [Flower](https://flower.readthedocs.io/en/latest/)

## Architecture

![01](img/01-swarm.png)

## AWS Architecture

![02](img/02-external-AWS-service.png)


## How to run project?

```
git clone https://github.com/rg3915/fullstack-django-vuejs.git
cd fullstack-django-vuejs
docker-compose -f docker-compose.dev.yml up --build -d
```


Enter in container and create super user:

```
docker container exec -it \
fullstack-django-vuejs_app_1 \
python manage.py createsuperuser \
--username="admin"
```

**Tips**:

* Dont use `postgres:12` because it does not allow Django `migrate` to work.
* Do not set `hostname` in `db` because it interferes with the comunication between Django and database.
* Do not set `container_name` in services because it interferes with the comunication between `nginx` e a `app`.

* Não use `postgres:12` porque ele não permite que o Django `migrate` funcione.
* Não defina `hostname` em `db` porque interfere na comunicação entre o Django e o banco.
* Não defina `container_name` nos serviços porque interfere na comunicação entre o `nginx` e a `app`.


## Portainer

```
docker run -d \
-p 9000:9000 \
--restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /opt/portainer:/data \
portainer/portainer
```

## Ports

Portainer: `localhost:9000`

Backend: `localhost/api/users/`

Flower: `localhost:5555/monitor`


## Running Celery

Without `queue`.

```
celery --app=myproject worker --loglevel=INFO
```

With `queue`.

```
celery --app=myproject worker --loglevel=INFO --queue=fila1
```

## Flower monitoring the tasks

The [flower](https://flower.readthedocs.io/en/latest/) monitoring Celery in realtime.

```
celery -A myproject flower
```

If stress Celery type and see in monitor

```
for i in $(seq 10); do curl localhost/task/print_numbers/; sleep 1; done
```



### django-celery-results

https://django-celery-results.readthedocs.io/en/latest/

```
python manage.py migrate django_celery_results
```

### Frontend

Add hoc

```
docker build -f DockerfileVueJS -t vuejs-app .

docker run -it -p 8080:8080 \
--rm --name vuejs \
vuejs-app
```

### Links

https://medium.com/@mdcg.dev/configurando-um-sistem-em-django-para-executar-tarefas-ass%C3%ADncronas-utilizando-celery-redis-e-53a30d0d2ec2

https://stackoverflow.com/a/54162975/802542

https://mattsegal.dev/django-prod-architectures.html

https://www.youtube.com/watch?v=3lD7zdwSYaU
