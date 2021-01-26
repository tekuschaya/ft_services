# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 10:12:14 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 11:09:49 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add --no-cache nginx php7-fpm phpmyadmin supervisor

RUN	mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx
RUN mkdir -p /var/tmp/phpmyadmin && chown -R nginx:nginx /var/tmp/phpmyadmin

COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/supervisord.conf /etc/supervisord.conf

COPY srcs/config.inc.php /etc/phpmyadmin/config.inc.php

WORKDIR /www

RUN	cp -a /usr/share/webapps/phpmyadmin/. ./
RUN	chown -R nginx:nginx ./

EXPOSE 5000

ENTRYPOINT supervisord -c /etc/supervisord.conf