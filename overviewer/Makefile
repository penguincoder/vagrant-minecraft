.PHONY: all clean

all:
	docker build -t overviewer . && \
	docker run \
		--detach \
		--restart always \
		--name overviewer \
		--volume $(MC_HOME)/minecraft/:/data \
		--volume $(MC_HOME)/overviewer/:/map \
		overviewer

clean:
	docker ps -a | grep overviewer && docker rm -f -v overviewer || true
