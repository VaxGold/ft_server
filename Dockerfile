# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: omercade <omercade@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/01 18:20:53 by omercade          #+#    #+#              #
#    Updated: 2020/12/11 20:40:12 by omercade         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# Docker instalations #
RUN apt update && \
	apt -y install nginx mariadb-server php-mbstring php-fpm php-mysql && \
    apt -y install openssl && \
    apt -y install wget && \
	apt -y install vim  && \
	apt -y install curl

# Copying important files at the docker root #
COPY ./srcs/init_container.sh ./
COPY ./srcs/nginx-config ./tmp/nginx-config
#COPY ./srcs/index.html /var/www/html/
COPY ./srcs/wp-config.php ./tmp/wp-config.php
COPY ./srcs/config.inc.php ./tmp/config.inc.php

# Command for docker #
CMD mysql -u root < ./configbase.sql && \
	bash
CMD bash init_container.sh