Local
```
1. docker build -t swarm-front .
2. docker run -d --name swarm-frontend -e VUE_APP_BACKEND_HOST='http://localhost:4000' -p 8300:80 swarm-frontend
```
GCP
1. build image
```
1. docker build -t swarm-front:gcp -f Dockerfile-gcp .
docker tag swarm-frontend:gcp asia.gcr.io/XXXX/swarm-frontend:gcp
```

2. local push remote
```
gcloud auth configure-docker
gcloud components update
gcloud docker -- push asia.gcr.io/XXXX/swarm-frontend:gcp
```

3. gcp compute engine
```
gcloud auth configure-docker (first)
docker pull asia.gcr.io/XXXX/swarm-frontend:gcp
docker run -d --name swarm-frontend -e VUE_APP_BACKEND_HOST='http://XXXXXX:4000' -p 8300:80 asia.gcr.io/jXXXX/swarm-frontend:gcp
```
4. Swagger
```
http://localhost:4000/swagger-ui.html#/
```
