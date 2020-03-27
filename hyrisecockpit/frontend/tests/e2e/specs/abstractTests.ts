import { clickElement, getElement } from "./helpers";

// CONTENT

export function testContentExistence(content: string): void {
  cy.contains(content);
}

export function testContentNoExistence(content: string): void {
  cy.contains(content).should("not.exist");
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
