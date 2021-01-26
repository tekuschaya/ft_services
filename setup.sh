# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/09 15:19:06 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 11:15:58 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# starting kubernetes cluster
minikube start \
		--driver=virtualbox --cpus=2 --memory='3000' --disk-size='20000mb' \
		--host-only-cidr='192.168.99.1/24' \

# enabling addons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb

# configuration ip pool
kubectl apply -f ./srcs/metallb-config.yaml
# creating memberlist secret
kubectl create secret generic -n metallb-system memberlist \
		--from-literal=secretkey="$(openssl rand -base64 128)"

# building containers
eval $(minikube -p minikube docker-env)

# nginx container
printf "\n>> Nginx is building... \n"
docker build -t nginx ./srcs/nginx > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-deploy/nginx-deploy.yaml
kubectl apply -f ./srcs/yaml-service/nginx-service.yaml

# mysql container
printf "\n>> MySQL is building ... \n"
docker build -t mysql ./srcs/mysql > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-storage/mysql-storage.yaml
kubectl apply -f ./srcs/yaml-deploy/mysql-deploy.yaml
kubectl apply -f ./srcs/yaml-service/mysql-service.yaml

# wordpress container
printf "\n>> Wordpress is building ... \n"
docker build -t wordpress ./srcs/wordpress > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-deploy/wordpress-deploy.yaml
kubectl apply -f ./srcs/yaml-service/wordpress-service.yaml

# phpmyadmin container
printf "\n>> PhpMyAdmin is building ... \n"
docker build -t phpmyadmin ./srcs/phpmyadmin > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-deploy/phpmyadmin-deploy.yaml
kubectl apply -f ./srcs/yaml-service/phpmyadmin-service.yaml

# ftps container
printf "\n>> Ftps is building ... \n"
docker build -t ftps ./srcs/ftps > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-deploy/ftps-deploy.yaml
kubectl apply -f ./srcs/yaml-service/ftps-service.yaml

# influxdb container
printf "\n>> InfluxDB is building ... \n"
docker build -t influxdb ./srcs/influxdb > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-storage/influxdb-storage.yaml
kubectl apply -f ./srcs/yaml-deploy/influxdb-deploy.yaml
kubectl apply -f ./srcs/yaml-service/influxdb-service.yaml

# telegraf metrics collector container
printf "\n>> Telegraf is building ... \n"
docker build -t telegraf ./srcs/telegraf > /dev/null
echo "Done. "
kubectl apply -f ./srcs/telegraf/telegraf-daemon.yaml

# grafana container
printf "\n>> Grafana is building ... \n"
docker build -t grafana ./srcs/grafana > /dev/null
echo "Done. "
kubectl apply -f ./srcs/yaml-deploy/grafana-deploy.yaml
kubectl apply -f ./srcs/yaml-service/grafana-service.yaml