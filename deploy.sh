docker build -t manjishri/multi-client:latest -t manjishri/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t manjishri/multi-server:latest -t manjishri/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t manjishri/multi-worker:latest -t manjishri/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push manjishri/multi-client:latest
docker push manjishri/multi-server:latest
docker push manjishri/multi-worker:latest

docker push manjishri/multi-client:$SHA
docker push manjishri/multi-server:$SHA
docker push manjishri/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=manjishri/multi-server:$SHA
kubectl set image deployments/client-deployment client=manjishri/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=manjishri/multi-worker:$SHA
