FROM python:3.8.1-buster

LABEL maintainer="upigorsch@me.com"

RUN mkdir -p /usr/local/Cockpit/hyrisecockpit
WORKDIR /usr/local/Cockpit
COPY    setup.py \
    Pipfile \
    Pipfile.lock \
    requirements.txt \
    .env \
    /usr/local/Cockpit/
COPY    hyrisecockpit/__init__.py \
    hyrisecockpit/exception.py \
    hyrisecockpit/message.py \
    hyrisecockpit/response.py \
    hyrisecockpit/settings.py \
    hyrisecockpit/backend \
    hyrisecockpit/database_manager \
    hyrisecockpit/workload_generator \
    /usr/local/Cockpit/hyrisecockpit/
RUN pip3.8 install -r requirements.txt && pip3.8 install -e .