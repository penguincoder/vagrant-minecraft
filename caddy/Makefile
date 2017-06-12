.PHONY: all clean

MC_HOME?=/home/andrew

all:
	docker run \
		--detach \
		--restart always \
		--name caddy \
		--publish 8088:80 \
		--volume $(MC_HOME)/overviewer_leaflet/:/var/www/html \
		zzrot/alpine-caddy

clean:
	docker ps -a | grep caddy && docker rm -f -v caddy || true
