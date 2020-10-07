minikube version
minikube start --memory=1907mb
kubectl version
kubectl cluster-info
kubectl get nodes
kubectl get pods --all-namespaces
kubectl create deployment hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
kubectl get pods
kubectl get deployments
kubectl get events
kubectl config view
kubectl expose deployment hello-minikube --type=NodePort
kubectl get services
minikube service hello-minikube --url
curl $(minikube service hello-minikube --url)

kubectl proxy --address='0.0.0.0' --disable-filter=true
minikube dashboard
