export function testContentExistence(content: string): void {
  cy.contains(content);
}

export function testContentNoExistence(content: string): void {
  cy.contains(content).should("not.exist");
}

export function testElementExistence(element: string): void {
  cy.get(element);
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
