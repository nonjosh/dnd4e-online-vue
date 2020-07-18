docker run -it --rm \
--name dnd4e-online-db \
-v "$PWD/db/DB_DATA":"/var/lib/postgresql/data" \
-e "POSTGRES_USER=postgres" \
-e "POSTGRES_PASSWORD=postgres" \
-e "PGDATA=/var/lib/postgresql/data/pg-data" \
-p 25432:5432 \
nonjosh/dnd4e-online-db

# docker run -it --rm \
# # --user "$(id -u):$(id -g)" \
# -v "$PWD"/db/sql:/docker-entrypoint-initdb.d \
# -v "$PWD"/db/DB_DATA:/var/lib/postgresql/data \
# -e "POSTGRES_USER=postgres" \
# -e "POSTGRES_PASSWORD=postgres" \
# -e "PGDATA=/var/lib/postgresql/data/pg-data" \
# postgres:13-alpine 