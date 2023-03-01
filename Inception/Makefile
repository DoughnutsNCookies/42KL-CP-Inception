# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: schuah <schuah@student.42kl.edu.my>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/01 14:30:57 by schuah            #+#    #+#              #
#    Updated: 2023/03/01 14:30:58 by schuah           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DC	=	docker-compose -f
YML	=	./srcs/docker-compose.yml

all:
	$(DC) $(YML) up -d --build

down:
	$(DC) $(YML) down

fclean:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q)

re:
	sudo make fclean; sudo make all	

.PHONY: all down fclean re
