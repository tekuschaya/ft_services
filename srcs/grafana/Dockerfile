# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/25 10:34:03 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/25 10:34:10 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN	apk update && apk upgrade

RUN apk add --no-cache grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY srcs/grafana.ini /etc/grafana.ini

RUN mkdir /provisioning
COPY srcs/provisioning /usr/share/grafana/conf/provisioning

RUN mkdir dashboards
COPY srcs/dashboards /dashboards/

EXPOSE 3000

COPY /srcs/start.sh /start.sh

CMD ./start.sh