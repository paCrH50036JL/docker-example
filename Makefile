
all:
	@echo "usage: make <anaconda3>"

anaconda3:
	podman build --rm -t anaconda3 -f anaconda3.Dockerfile
	podman run --rm -it anaconda3