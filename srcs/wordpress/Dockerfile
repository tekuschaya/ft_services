# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/25 10:33:18 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 11:10:54 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN apk add --no-cache nginx php7 php7-fpm php7-dom php7-ftp php7-curl\
	php7-gd php7-iconv php7-json php7-mbstring php7-mysqli php7-openssl\
	php7-posix php7-xml php7-xmlrpc php7-soap php7-zip php7-common\
	php7-phar supervisor

RUN	mkdir -p /run/nginx && chown -R nginx:nginx /run/nginx

COPY srcs/default.conf /etc/nginx/conf.d
COPY srcs/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /usr/share/webapps
WORKDIR /usr/share/webapps
ADD	https://wordpress.org/latest.tar.gz latest.tar.gz
RUN tar -xvzf latest.tar.gz 

ADD	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar wp-cli.phar
RUN	chmod +x ./wp-cli.phar && mv ./wp-cli.phar /usr/local/bin/wp

WORKDIR /www/

RUN cp -a /usr/share/webapps/wordpress/* ./
COPY srcs/wp-config.php ./wp-config.php
RUN	chown -R nginx:nginx ./

EXPOSE 5050

COPY srcs/start.sh ./start.sh
RUN chmod +x start.sh

CMD	./start.sh