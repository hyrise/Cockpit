# https://github.com/hyrise/hyrise/wiki/Docker-Image
FROM node:alpine

WORKDIR /usr/local/Cockpit/hyrisecockpit/frontend
COPY hyrisecockpit/frontend .
ARG VUE_APP_BACKEND_HOST
# https://github.com/webpack/webpack/issues/14532#issuecomment-947012063
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm set progress=false \
	&& npm install --no-optional \
	&& npm run build:min
EXPOSE 5000
ENTRYPOINT ["npm", "run", "deploy"]