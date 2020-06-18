echo "Conectar no RDS e criar o database."

# connect

cat << EOF
sudo su - postgres
psql
 CREATE ROLE rg3915 ENCRYPTED PASSWORD 'tistysterappikeliessemssystiflow' LOGIN;
CREATE DATABASE dbloxodonta OWNER rg3915;
EOF


sudo apt update

echo "Instalando Docker"
curl -fsSL https://get.docker.com/ | bash

echo "Instalando docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Adicionando usuário atual no grupo Docker."
sudo gpasswd -a $USER docker
sudo setfacl -m user:$USER:rw /var/run/docker.sock
docker run hello-world

echo "Clonando o repo"
git clone https://github.com/rg3915/fullstack-django-vuejs.git
mv fullstack-django-vuejs app
cd app
docker-compose -f docker-compose.yml up --build -d

cat << EOF > .env
DEBUG=True
SECRET_KEY=YTNlZjk5OTY4YjNlOWUxZjBkYTQwNzc2ZDZiMmVhNmU2ZmZlZG
ALLOWED_HOSTS=*
DB_HOST=URL
POSTGRES_DB=dbloxodonta
POSTGRES_USER=rg3915
POSTGRES_PASSWORD=tistysterappikeliessemssystiflow
EOF

