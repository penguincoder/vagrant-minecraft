.PHONY: all clean

all:
	docker run \
		--detach \
		--restart always \
		--name caddy \
		--publish 8088:80 \
		--volume $(MC_HOME)/overviewer/:/var/www/html \
		zzrot/alpine-caddy

clean:
	docker ps -a | grep caddy && docker rm -f -v caddy || true
