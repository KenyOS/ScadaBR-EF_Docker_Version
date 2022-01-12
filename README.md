# ScadaBR-EF Ver. 1.2

https://hub.docker.com/r/kenyos/scadabr-ef

Instruction:

1- Install docker-compose on your system if you have no idea go here: https://github.com/docker/compose, usually you should be able to install using your package manager: sudo apt-get install docker-compose or yay install docker-compose for Arch linux

2 - let's create a folder installation and move to it.

mkdir -p ScadaBR && cd $_

3 - We'll create our docker-compose.yml.

sudo apt-get install vim

vim docker-compose.yml

paste these lines and you definitely should check this file and edit to your own needs

version: '3'
services:
  database:
    container_name: scadabr_mysql
    image: mysql/mysql-server:5.7
    ports:
      - "3306:3306"
    environment: 
      - MYSQL_ROOT_PASSWORD=root
      - MYSQL_USER=root
      - MYSQL_PASSWORD=root
      - MYSQL_DATABASE=scadabr
    expose: ["3306"]
    volumes:
      - ./docker/volumes/databases:/home/
  phpmyadmin:
    container_name: scadabr_phpmyadmin
    depends_on:
      - database
    image: phpmyadmin/phpmyadmin
    ports:
      - '8081:80'
    environment:
      PMA_HOST: database
      MYSQL_ROOT_PASSWORD: root
  scadabr:
    container_name: scadabr-ef
    privileged: true
    image: kenyos/scadabr-ef:latest
    ports: 
      - "8080:8080"
    depends_on: 
      - database
    expose: ["8080", "8000"]
    links:
      - database:database

let run our multi-containers

docker-compose up -d

you'll see something like this

Creating scadabr_mysql ... done

Creating scadabr-ef         ... done

Creating scadabr_phpmyadmin ... done

after couple of minutes our service will be available on http://127.0.0.1:8080/ScadaBR

phpmyadmin avaiable on http://127.0.0.1:8081 to manage the mysql database (not obligatory but it's nice to have)

you can remove all containers by using (you need to be on the same directory where docker-compose.yml is):

docker-compose down

if you need to contact me feel free to send message on ScadaBR Forum: https://forum.scadabr.com.br/u/kenyos
