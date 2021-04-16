# Build
docker build -t q/alpine .

# Run
docker run -it -d --name alpine q/alpine
docker run -it --rm --name alpine q/alpine /bin/sh

# Mount volume
docker run -it --rm -v /extra --name alpine q/alpine /bin/sh
docker run -it --rm --mount type=volume,destination=/data --name alpine q/alpine /bin/sh

# Run and mount 2 additional anoonymous volumes
docker run -it --rm --mount type=volume,destination=/data --mount type=volume,destination=/more --name alpine q/alpine /bin/sh
docker run -it --rm -v /extra --name alpine q/alpine /bin/sh

# Remove
docker stop q/alpine && docker rm -q q/alpine

