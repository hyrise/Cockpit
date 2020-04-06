export function clickElement(selector: string): void {
  cy.get(selector).click({ force: true });
}

export function getElement(selector: string): void {
  cy.get(selector);
}

export function clickContentOfSelect(idx: number, content: string): void {
  cy.get("div[role=listbox]")
    .eq(idx)
    .within(() => {
      cy.get("div")
        .contains(content)
        .click({ force: true });
    });
}

export function getSelectorByConfig(elementType: string, id: string): string {
  return `${elementType}[id=${id}]`;
}

export function roundNumber(
  data: number,
  ratio: number,
  factor: number = 1,
  even: boolean = true
): number {
  const rounded = Math.floor(data * factor) / ratio;
  return even ? Math.floor(rounded) : rounded;
}

export function formatDateToHHMMSS(date: Date): string {
  return date.toLocaleTimeString("de-DE");
}
