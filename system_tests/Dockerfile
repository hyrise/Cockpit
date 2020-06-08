FROM python:3.8.3-slim

LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit
COPY . .    
RUN apt-get update \
	&& apt-get install -y libpq-dev \
	&& pip install pipenv \
	&& pipenv --three --python=`which python` \
	&& pipenv sync --dev \
	&& pipenv install --system --deploy --ignore-pipfile --dev
WORKDIR /usr/local/Cockpit/system_tests
# CMD pytest ./test_system.py
CMD /bin/bash
EXPOSE 8000-8003