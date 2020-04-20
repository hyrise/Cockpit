FROM python:3.8.2-slim

LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit
COPY . .    
RUN pip3.8 install -r requirements.txt \
	&& pip3.8 install .
EXPOSE 8001
ENTRYPOINT cockpit-manager