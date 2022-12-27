include .env

install:
	npm install
	
run-app:
	docker build -t dicoding-proyek-pertama:v1 .
	docker run -d --name dicoding-proyek-pertama -p 8080:8080 dicoding-proyek-pertama:v1

down-app:
	docker rm -f dicoding-proyek-pertama
	docker rmi dicoding-proyek-pertama:v1 .

restart-app:
	-make down	
	make run

restart2-app:
	docker stop dicoding-proyek-pertama
	docker start dicoding-proyek-pertama

build-app:
	docker build -t dicoding-proyek-pertama:v1 .

logs-app:
	docker logs -f dicoding-proyek-pertama

push-img:
	echo "BUILD DOCKER IMAGE"
	docker build -t dicoding-proyek-pertama:v1 .
	docker image prune --filter label=stage=builder

	echo "CREATE IMAGE TAGGING"
	docker tag dicoding-proyek-pertama:v1 ghcr.io/fajar-islami/dicoding-proyek-pertama:v1

	echo "PUSHING DOCKER IMAGE TO GITHUB"
	echo $CR_PAT | docker login ghcr.io
	docker push ghcr.io/fajar-islami/dicoding-proyek-pertama:v1

token:
	export CR_PAT=${CR_PAT}

mongo:
	docker compose up -d item-db

# DOCKER COMPOSE
up:
	docker compose up -d

down:
	docker compose down -v

logs:
	docker compose logs

stop:
	docker compose stop

start:
	docker compose start


# GIT
cmt: # EXAMPLE : make cmt"COMMIT COMMENT"
	git add .
	git commit -am ${cmt}