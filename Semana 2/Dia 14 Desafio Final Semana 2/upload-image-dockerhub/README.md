# Subir imagen a Docker Hub:

`sudo docker login`

`sudo docker build -t blessedc0de/holamundo:latest .`

`sudo docker push blessedc0de/holamundo:latest`

`sudo docker run --name bl3ssedc0de-container blessedc0de/holamundo:latest`

`sudo docker logs bl3ssedc0de-container`
