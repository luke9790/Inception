scp -r ./Inception/ user@ipaddr:~/


Before starting the evaluation, run this command in the terminal: 

"docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null"

https://login.42.fr
https://login.42.fr/wp-login.php


docker exec -it mariadb mysql -u root

docker exec -it redis redis-cli  ping

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' vsftpd     (prendiamo l ip per filezilla)

https://localhost:9443
