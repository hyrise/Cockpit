# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM node:alpine
LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit/hyrisecockpit/frontend
COPY hyrisecockpit/frontend .
RUN npm install serve \
	&& npm install \
	&& npm run build