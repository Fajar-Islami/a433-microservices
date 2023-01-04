registry:=ghcr.io
username:=fajar-islami
image:=karsajobs
tags:=latest

dockerlogin:
	printenv
	echo $GITHUB_TOKEN
	export GITHUB_TOKEN=${GITHUB_TOKEN}
	echo ${GITHUB_TOKEN} | docker login ${registry}

dockerpush:
	docker push ${registry}/${username}/${image}:${tags}

dockerbuild:
	docker build -t ${registry}/${username}/${image}:${tags} .

cmt: ## make cmt c={commit message}
	git add .
	git commit -am '${c}'
