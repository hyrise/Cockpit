FROM python:3.8.5-slim

WORKDIR /usr/local/Cockpit
COPY . . 
ADD ./hyrisecockpit/workload_generator/workloads /usr/local/lib/python3.8/site-packages/hyrisecockpit/workload_generator/workloads   
RUN pip3.8 install -r requirements.txt \
    && pip3.8 install .
RUN cp .env.docker .env
EXPOSE 8000
ENTRYPOINT cockpit
