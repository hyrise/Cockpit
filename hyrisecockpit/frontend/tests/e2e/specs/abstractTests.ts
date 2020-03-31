import { clickElement, getElement } from "./helpers";

// DATA

export function testMaxDecimalDigits(content: string, maxDigits: number): void {
  const decimal = content.split(".");
  const decimalOnly = decimal[1].split(" ");

  expect(decimalOnly[0]).to.have.length.of.at.most(maxDigits);
}

// CONTENT

export function testContentExistence(content: string): void {
  cy.contains(content);
}

export function testContentNoExistence(content: string): void {
  cy.contains(content).should("not.exist");
}

// BUTTONS

export function testButtonIsDisabled(element: string): void {
  cy.get(element).should("be.disabled");
}

// ELEMENT

export function testElementExistence(element: string): void {
  getElement(element);
}

export function testElementNoExistence(element: string): void {
  cy.get(element).should("not.exist");
}

export function testElementVisibility(element: string): void {
  cy.get(element).should("be.visible");
}

export function testElementNoVisibility(element: string): void {
  cy.get(element).should("not.be.visible");
}

export function testElementTrigger(
  rootSelector: string,
  triggeredSelector: string
): void {
  clickElement(rootSelector);
  getElement(triggeredSelector);
}

// URL

export function testRedirection(selector: string, newRoute: string): void {
  clickElement(selector);
  cy.url().should("contain", newRoute);
}
