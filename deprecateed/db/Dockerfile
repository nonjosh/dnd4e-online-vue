FROM postgres:13-alpine

ARG USER_ID
ARG GROUP_ID

RUN addgroup -S -g $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID -S -u $GROUP_ID user
USER user

COPY /db/sql/* /docker-entrypoint-initdb.d
