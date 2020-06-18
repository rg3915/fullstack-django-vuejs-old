echo "Conectar no RDS e criar o database."

# connect

cat << EOF
psql \
--host=url \
--port=5432 \
--username=postgres \
--password \
--dbname=nomedobanco

 CREATE ROLE rg3915 ENCRYPTED PASSWORD 'tistysterappikeliessemssystiflow' LOGIN;
EOF


sudo apt update
sudo apt -y upgrade


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
cp ../.env .
docker-compose -f docker-compose.yml up --build -d
