# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/25 10:32:50 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 10:32:52 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN	apk add --no-cache mysql mysql-client

RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql

COPY srcs/my.cnf /etc/
COPY ./srcs/start.sh /start.sh
COPY ./srcs/init.sql /init.sql

RUN chmod +x /start.sh

VOLUME /var/lib/mysql

CMD ./start.sh