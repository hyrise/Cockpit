FROM python:latest

WORKDIR /usr/local/Cockpit
COPY . .  
# pip3.8 install . will use setup.py to install the cockpit module
RUN pip3 install -r requirements.txt \
    && pip3 install .
# Python will look in the site-packages directory 
RUN mv ./hyrisecockpit/workload_generator/workloads /usr/local/lib/python3.8/site-packages/hyrisecockpit/workload_generator/workloads 
EXPOSE 8000
ENTRYPOINT cockpit


