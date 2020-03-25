import { clickElement } from "../helpers";

export function testRedirection(
  elementType: string,
  content: string,
  newRoute: string
): void {
  clickElement(elementType, content);
  cy.url().should("contain", newRoute);
}

export function testElementTrigger(
  elementType: string,
  content: string,
  openedContent: string
): void {
  clickElement(elementType, content);
  cy.contains(openedContent);
}
