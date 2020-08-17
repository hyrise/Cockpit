FROM python:3.8.5-slim

WORKDIR /usr/local/Cockpit
COPY . .    
RUN pip3.8 install -r requirements.txt \
    && pip3.8 install .
EXPOSE 8000
ENTRYPOINT cockpit
