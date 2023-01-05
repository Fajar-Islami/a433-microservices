kube-mongo:
	kubectl apply -f mongodb -n karsajobs-ns

kube-delete-mongo:
	kubectl delete -f mongodb -n karsajobs-ns

kube-get:
	kubectl get statefulset,service,po,pv,pvc -n karsajobs-ns


kube-get-pod:
	kubectl get pod -o wide -n karsajobs-ns

test:
	kubectl apply -f mongodb/mongo-statefulset.yml -n karsajobs-ns --dry-run=client