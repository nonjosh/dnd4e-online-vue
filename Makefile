PWD := ${PWD}
USER_ID := ${shell id -u}
GROUP_ID := ${shell id -g}

run_node:
	docker run -it --rm \
		--name dnd4e-online-vue \
		--user ${USER_ID}:${GROUP_ID} \
		-v ${PWD}/node:/app \
		-p 2080:8080 \
		-w="/app" \
		node:14.4.0 ./init.sh

run_db:
	docker build -t nonjosh/dnd4e-online-db \
		--build-arg USER_ID=${USER_ID} \
		--build-arg GROUP_ID=${GROUP_ID} \
		-f db/Dockerfile \
		.
	docker run -it --rm \
		--name dnd4e-online-db \
		-v "${PWD}/db/DB_DATA":"/var/lib/postgresql/data" \
		-e "POSTGRES_USER=postgres" \
		-e "POSTGRES_PASSWORD=postgres" \
		-e "PGDATA=/var/lib/postgresql/data/pg-data" \
		-p 25432:5432 \
		nonjosh/dnd4e-online-db

rm_db:
	# docker rm -f dnd4e-online-db
	docker image rm nonjosh/dnd4e-online-db
	rm -r ./db/DB_DATA/pg-data