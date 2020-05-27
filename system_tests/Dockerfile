FROM python:3.8.3-slim

LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit
COPY . .    
RUN pip3.8 install -r requirements.txt \
	&& pip3.8 install -r requirements-dev.txt \
	&& pip3.8 install .
ENTRYPOINT pytest ./system_tests/test_system.py