### Upload votting-app to Docker Hub.

```
cd vote/
sudo docker build -t blessedc0de/voting-app:vote .
sudo docker push blessedc0de/voting-app:vote

cd result/
sudo docker build -t blessedc0de/voting-app:result .
sudo docker push blessedc0de/voting-app:result

cd worker/
sudo docker build -t blessedc0de/voting-app:worker .
sudo docker push blessedc0de/voting-app:worker

```
