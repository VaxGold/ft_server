# ft_server


#### ----- Comandos útiles ----- ####

docker rm --force -v NombreContenedor
# el comando --force para el contenedor si esta iniciado
# el comando -v borra los volumenes del contenedor

docker run --name mynginx1 -p 80:80 -p 443:443 -d nginx
# mynginx1 es el nombre del contenedor basado en la imagen de nginx
# la opcion -d especifica que el contenedor esta en "detached mode" (el contenedor sigue funcionando hasta lo paramos
# pero no responde a los comandos del terminal)
# la opcion -p le dice a docker los puertos expuestos en el contenedor por la imagen nginx (puerto 80) al puerto especificado
# en el host de docker, el primer parametro especifica el puerto en el host Docker, el segundo es mapeado al puerto del contenedor.
# el comando devuelve el ID del contenedor (en mi caso ee4012b85d7c) este ID sera usado en los logs.
# para verificar que el contenedor creado esta funcionando escribimos docker ps en la terminal
# este comando nos permite verificar el puerto que esta mapeado el contenedor.

# Comprobar distro
docker exec container-name cat /etc/os-release

# Crear imagen docker
docker build - < Dockerfile

# Crear imagen de docker y darle un nombre y version
docker build -t imagen1:1.0 - < Dockerfile

#### ----- Containers ----- ####
Use docker container my_command
create — Create a container from an image.
start — Start an existing container.
run — Create a new container and start it.
ls — List running containers.
inspect — See lots of info about a container.
logs — Print logs.
stop — Gracefully stop running container.
kill —Stop main process in container abruptly.
rm— Delete a stopped container.

#### ----- Images ----- ####
Use docker image my_command
build — Build an image.
push — Push an image to a remote registry.
ls — List images.
history — See intermediate image info.
inspect — See lots of info about an image, including the layers.
rm — Delete an image.
Misc
docker version — List info about your Docker Client and Server versions.
docker login — Log in to a Docker registry.
docker system prune — Delete all unused containers, unused networks, and dangling images.

## Lista de imagenes ##
docker images
## Lista de contenedores ## (el -a es para listar todos los contenedores)
docker ps -a

## Construir y correr server ##
docker build -t web_42 .
docker run --name web_42 -it -p 80:80 -p 443:443 web_42

## Parar y borrar todo ##
docker rm -f $(docker ps -a -q) && docker rmi $(docker images -q)


#### ----- Autoindex ----- ####

 1. Comprobar que funciona en https://localhost/wordpress/wp-includes/ 
 2. Modificar el "on" en mi_web_42 que se encuentra en el directorio /etc/nginx/sites-available dentro del contenedor
 3. Reiniciar nginx con "service nginx restart"
