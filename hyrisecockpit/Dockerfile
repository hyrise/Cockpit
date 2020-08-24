FROM python:3.8.5-slim

WORKDIR /usr/local/Cockpit
COPY . .  
RUN pip3.8 install -r requirements.txt \
    && pip3.8 install .
# Python will look in the site-packages directory 
RUN mv ./hyrisecockpit/workload_generator/workloads /usr/local/lib/python3.8/site-packages/hyrisecockpit/workload_generator/workloads 
EXPOSE 8000
ENTRYPOINT cockpit
