FROM python:3.8.1-slim

LABEL maintainer="upigorsch@me.com"

# RUN apt-get update \
#     && apt-get install -y \
#     build-essential \
#     libbz2-dev \
#     libpq-dev \
#     libreadline-dev \
#     libssl-dev \
#     libsqlite3-d \
#     make \
#     zlib1g-dev 
# RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
# RUN echo 'export PATH="/home/$USER/.pyenv/bin:$PATH" \
#     eval "$(pyenv init -)" \
#     eval "$(pyenv virtualenv-init -)"' >> /root/.bashrc && exec "$SHELL"
# RUN pyenv install 3.8.1 && pyenv local 3.8.1
RUN mkdir -p /usr/local/Cockpit
WORKDIR /usr/local/Cockpit
COPY . .
RUN pip3.8 install -r requirements.txt && pip3.8 install .
