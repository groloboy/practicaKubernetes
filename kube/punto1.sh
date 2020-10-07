minikube addons enable ingress
kubectl get pods -n kube-system

kubectl create deployment web --image=gcr.io/google-samples/hello-app:1.0
kubectl expose deployment web --type=NodePort --port=8080
kubectl get service web
minikube service web --url
	curl [salida]

vim example-ingress.yaml
	apiVersion: networking.k8s.io/v1
	kind: Ingress
	metadata:
	  name: example-ingress
	  annotations:
	    nginx.ingress.kubernetes.io/rewrite-target: /$1
	spec:
	  rules:
	  - host: hello-world.info
	    http:
	      paths:
	      - path: /
	        pathType: Prefix
	        backend:
	          service:
	            name: web
	            port:
	              number: 8080

kubectl apply -f example-ingress.yaml
kubectl get ingress
	#tomar nota de la ip
sudo su
echo "172.17.0.3 hello-world.info" >> /etc/hosts       # .3 para mi caso
exit
curl hello-world.info

kubectl create deployment web2 --image=gcr.io/google-samples/hello-app:2.0
kubectl expose deployment web2 --port=8080 --type=NodePort
#Agregar al final del example-ingress.yaml
      - path: /v2
        pathType: Prefix
        backend:
          service:
            name: web2
            port:
              number: 8080

kubectl apply -f example-ingress.yaml


curl hello-world.info
curl hello-world.info/v2
