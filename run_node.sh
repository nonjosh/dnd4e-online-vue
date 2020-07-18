docker run -it --rm \
--name dnd4e-online-vue \
--user "$(id -u):$(id -g)" \
-v "$PWD/node":"/app" \
-p 2080:8080 \
-w="/app" \
node:14.4.0 ./init.sh