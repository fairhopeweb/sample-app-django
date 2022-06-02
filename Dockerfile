FROM python:3.10-slim

RUN python -m pip install --upgrade pip

RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    curl \
    grep \
    libpq-dev

COPY requirements.txt requirements.txt
RUN python -m pip install -r requirements.txt

COPY . .
