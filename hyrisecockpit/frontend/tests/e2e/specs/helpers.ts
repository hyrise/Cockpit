export function clickElement(selector: string): void {
  cy.get(selector).click({ force: true });
}

export function getElement(selector: string): void {
  cy.get(selector);
}

export function getSelectorByConfig(elementType: string, id: string): string {
  return `${elementType}[id=${id}]`;
}
