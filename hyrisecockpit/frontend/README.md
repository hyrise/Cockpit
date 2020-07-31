# Cockpit Frontend

This frontend project uses the Vue Composition API (https://composition-api.vuejs.org/), TypeScript (https://www.typescriptlang.org/) and Vuetify as Material Design Framework (https://vuetifyjs.com/de-DE/).

## Initial Setup
Before starting the server, you need to locally install all dependencies of the project by running:

```
npm install
```
To connect to a running backend, you need to create  a `.env` file in the frontend top level folder with your custom configuration. An example structure can be found in `.env.example`. To reset your config to the default connection just run `npm run reset:config`.


### Development

To start the server for development with hot-reloads, run:

```
npm run serve
```

### Production

To start the server for development with minification, run (To skip optional dependencies, add `:min`): 

```
npm run build
```
When the process finished and all files were compiled, deploy the server by running: 

```
npm run deploy
```


## Linting

To automatically lint all files, run:

```
npm run lint
```

## Testing

This project uses Cypress (https://www.cypress.io/) for UI/E2E-Testing. To start all tests with UI, run:

```
npm run test:e2e
```
To disable UI and execute all tests in headless mode, run:  `npm run test:e2e:headless`
All of the tests are using a backend stub with mocked responses. This backend stub can also be used for development purposes by mocking all network requests in a local node server. To start this test server, execute the following steps:
```
cd Cockpit/hyrisecockpit/frontend/devServer
```

```
npm install
```

```
npm start
```
The server runs at `http://127.0.0.1:3000/` per default. To connect to this server in your frontend app, replace the backendUrl in the top level `config.ts`. To run all tests against this server execute `npm run test:e2e:stubless` or `test:e2e:headless:stubless`.
