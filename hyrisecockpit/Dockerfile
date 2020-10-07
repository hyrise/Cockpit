FROM python:3.8

WORKDIR /usr/local/Cockpit
COPY . .  
# pip3.8 install . will use setup.py to install the cockpit module
RUN pip3 install -r requirements.txt  \
    && pip3 install .
EXPOSE 8000
ENTRYPOINT ["cockpit", "--backend"]


