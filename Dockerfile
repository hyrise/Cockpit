FROM python:3.8.1-buster

LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit
COPY . .
RUN rm -rf /usr/local/Cockpit/frontend
RUN pip install -r requirements.txt && pip install .