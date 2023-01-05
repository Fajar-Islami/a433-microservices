kube-mongo:
	kubectl apply -f mongodb -n karsajobs-ns

kube-delete-mongo:
	kubectl delete -f mongodb -n karsajobs-ns

kube-backend:
	kubectl apply -f backend -n karsajobs-ns

kube-delete-backend:
	kubectl delete -f backend -n karsajobs-ns

kube-frontend:
	kubectl apply -f frontend -n karsajobs-ns

kube-delete-frontend:
	kubectl delete -f frontend -n karsajobs-ns



kube-get:
	kubectl get statefulset,service,po,pv,pvc -n karsajobs-ns


kube-get-pod:
	kubectl get pod -o wide -n karsajobs-ns

test:
	kubectl apply -f mongodb/mongo-statefulset.yml -n karsajobs-ns --dry-run=client

