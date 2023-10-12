sudo docker stop $(docker ps -aq)
sudo docker rm $(docker ps -aq)
sudo docker network prune --force