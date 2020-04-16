# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM node:buster
LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit/hyrisecockpit/frontend
COPY hyrisecockpit/frontend .
RUN npm set progress=false \
	&& npm ci \
	&& npm install -g serve \
	&& npm run build