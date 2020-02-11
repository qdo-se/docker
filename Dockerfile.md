# RUN for build-time


# ENTRYPOINT for run-time, not overridden, 1 per Dockerfile


# CMD for run-time default, can be overridden, 1 per Dockerfile


# ENV persists during build-time and run-time
# it is useful to update PATH environment variable

# Note: 'environment' in docker-compose.yaml is for key-value only, no variable expansion. It's good for secret and host-specific values

# Note: ARG in Dockerfile and 'args under build' in docker-compose.yaml can be only accessible during build-time. One use case is we can set 'args under build' value in docker-compose.yaml to pass those values to ARG in Dockerfile
https://docs.docker.com/compose/compose-file/#args

