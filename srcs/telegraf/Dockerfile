# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/11 10:20:43 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 10:37:33 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN	apk add --no-cache telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY ./telegraf.conf /etc/telegraf.conf

VOLUME /var/run/docker.sock

ENTRYPOINT telegraf --config /etc/telegraf.conf