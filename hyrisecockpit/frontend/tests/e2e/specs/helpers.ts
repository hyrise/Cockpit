export function clickElement(selector: string): void {
  cy.get(selector).click({ force: true });
}

export function getElement(selector: string): void {
  cy.get(selector);
}

export function clickContentOfSelect(
  idx: number,
  content: string,
  element?: string
): void {
  cy.get(element ? element : "div[role=listbox]")
    .eq(idx)
    .within(() => {
      cy.get("div").contains(content).click({ force: true });
    });
}

export function getSelectorByConfig(elementType: string, id: string): string {
  return `${elementType}[id=${id}]`;
}

export function waitForChartRender(): void {
  cy.wait(1000);
}

// FORMATTING HELPERS

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

export function cutNumber(data: number, digits: number): number {
  return roundNumber(data, Math.pow(10, digits), Math.pow(10, digits), false);
}

export function assignToObject(data: any[], type: string): Object {
  const newData: any = {};
  data.forEach((entry: any) => {
    newData[entry.id] = entry[type][0][type];
  });
  return newData;
}
