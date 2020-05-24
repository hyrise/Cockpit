FROM python:3.8.3-slim

LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit
COPY . .    
RUN pip3.8 install -r requirements.txt \
	&& pip3.8 install .
EXPOSE 8002
EXPOSE 8003
ENTRYPOINT cockpit-generator