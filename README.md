# frontend

```sh
docker run -it --rm --name temp_node \
-v $PWD/node:/app \
-u 1000:1000 \
-p 1080:8080 nonjosh/vue-cli bash

docker-compose run node
```