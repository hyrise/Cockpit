import { clickElement, getElement } from "../helpers";

export function testRedirection(selector: string, newRoute: string): void {
  clickElement(selector);
  cy.url().should("contain", newRoute);
}

export function testElementTrigger(
  rootSelector: string,
  triggeredSelector: string
): void {
  clickElement(rootSelector);
  getElement(triggeredSelector);
}
