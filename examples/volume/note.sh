# Build
docker build -t q/alpine .

# Run
docker run -it --rm --name alpine q/alpine /bin/sh

# Run and mount 2 additional anoonymous volumes
docker run -it --rm --mount type=volume,destination=/extra --mount type=volume,destination=/more --name alpine q/alpine /bin/sh

# Remove
docker run -it -d --name alpine q/alpine
