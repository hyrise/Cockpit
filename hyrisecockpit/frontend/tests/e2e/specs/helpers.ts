export function clickElement(elementType: string, content: string): void {
  cy.get(elementType)
    .contains(content)
    .scrollIntoView()
    .click({ force: true });
}
