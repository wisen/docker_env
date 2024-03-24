del /F Dockerfile
copy ubuntu-xorg.Dockerfile Dockerfile
docker image build --rm --no-cache --progress plain -t ubuntu-xorg:20.04 .
del /F Dockerfile
