# syntax = docker/dockerfile:experimental
FROM python:3.9.6-slim
MAINTAINER Kazutaka Mise <misebox@gmail.com>

COPY requirements.txt /requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install -r /requirements.txt

WORKDIR /src

CMD ["pip-compile", "--generate-hashes", "--upgrade", "requirements.in"]
