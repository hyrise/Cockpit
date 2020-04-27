// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
// Cypress.Commands.add("login", (email, password) => { ... })
//
//
// -- This is a child command --
// Cypress.Commands.add("drag", { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add("dismiss", { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This is will overwrite an existing command --
// Cypress.Commands.overwrite("visit", (originalFn, url, options) => { ... })

import { getGetAlias } from "../setup/helpers";

// count numbers of requests
Cypress.Commands.add("numberOfRequests", (alias) =>
  cy
    .wrap()
    .then(
      () => cy.state("requests").filter((req) => req.alias === alias).length
    )
);

// setup temporary app state
Cypress.Commands.add("setupAppState", (backend) => {
  backend.start();
  cy.visit("/");
  cy.wait("@" + getGetAlias("database"));
  cy.get("@" + getGetAlias("database"));
});

// setup request data
Cypress.Commands.add("setupData", (request) => {
  cy.wait("@" + getGetAlias(request));
  cy.get("@" + getGetAlias(request));
});

// clean temporary app state manually
Cypress.Commands.add("cleanAppState", (backend, payload) => {
  if (Cypress.env("stubless")) {
    cy.request("POST", "http://localhost:3000/clean/", payload);
  } else {
    backend.reload(payload.request, payload.id, payload.method);
  }
});

// update temporary app state manually
Cypress.Commands.add("updateAppState", (backend, payload) => {
  if (!Cypress.env("stubless"))
    backend.reload(payload.request, payload.id, payload.method);
});
