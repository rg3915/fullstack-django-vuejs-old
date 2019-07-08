FROM python:3.7
ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev
ENV DOCKER_CONTAINER 1
RUN mkdir code
COPY ./requirements.txt code/requirements.txt
RUN pip install -r code/requirements.txt
COPY . code/
WORKDIR code/
EXPOSE 8000