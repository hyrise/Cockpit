# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM node:alpine
LABEL maintainer="upigorsch@me.com"

WORKDIR /usr/local/Cockpit/hyrisecockpit/frontend
COPY hyrisecockpit/frontend .
RUN npm set progress=false \
	&& npm install -g serve \
	&& npm ci \
	&& npm run build