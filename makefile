registry:=ghcr.io
username:=fajar-islami
image:=karsajobs
tags:=latest

dockerlogin:
	export CR_PAT=${CR_PAT}
	echo ${CR_PAT} | docker login ${registry} -u ${USERNAME} --password-stdin

dockerpush:
	docker push ${registry}/${username}/${image}:${tags}

dockerbuild:
	docker build -t ${registry}/${username}/${image}:${tags} .

cmt: ## make cmt c={commit message}
	git add .
	git commit -am '${c}'
