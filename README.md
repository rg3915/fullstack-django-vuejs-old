# fullstack-django-vuejs

This is a Fullstack test project, and use.

* Ansible
* Docker
* Swarm
* Django 2.2.12
* VueJS
* Nginx
* PostgreSQL
* Celery
* Redis
* Flower


![01](img/01-swarm.png)

![02](img/02-external-AWS-service.png)


## Como rodar o projeto?

* Clone esse repositório.
* Crie um virtualenv com Python 3.
* Ative o virtualenv.
* Instale as dependências.
* Rode as migrações.

```
git clone https://github.com/rg3915/fullstack-django-vuejs.git
cd fullstack-django-vuejs
docker-compose up --build -d
```

https://www.youtube.com/watch?v=3lD7zdwSYaU


Entre no container e rode as migrações:

```
docker container exec -ti ID python manage.py migrate
docker container exec -ti ID python manage.py createsuperuser
```


## Portainer

```
docker run -d \
-p 9000:9000 \
--restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /opt/portainer:/data \
portainer/portainer
```

## Portas

Backend: localhost:82/api/users/

## Rodando o Celery

Dá pra fazer sem o `queue`.

```
# terminal 1
celery --app=myproject worker --loglevel=INFO
```

Mas o `queue` define uma fila.

```
# terminal 1
celery --app=myproject worker --loglevel=INFO --queue=fila1
```

## Experimentando o flower

O [flower](https://flower.readthedocs.io/en/latest/) serve pra monitorar o Celery em realtime.

Rode num outro terminal o comando

```
# terminal 2
celery -A myproject flower
```

Se quiser estressar o Celery e ver no monitor digite

```
for i in $(seq 10); do curl localhost:8000/task/print_numbers/; sleep 1; done
```

A url do monitor é http://localhost:5555/monitor


### Instalando e configurando django-celery-results

https://django-celery-results.readthedocs.io/en/latest/

```
python manage.py migrate django_celery_results
```

### Links

https://medium.com/@mdcg.dev/configurando-um-sistem-em-django-para-executar-tarefas-ass%C3%ADncronas-utilizando-celery-redis-e-53a30d0d2ec2

https://stackoverflow.com/a/54162975/802542

https://mattsegal.dev/django-prod-architectures.html

