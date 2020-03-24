export function testRedirection(
  elementType: string,
  content: string,
  newRoute: string
): void {
  cy.get(elementType)
    .contains(content)
    .click();
  cy.url().should("contain", newRoute);
}
