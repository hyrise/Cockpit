/** Test correct rounding of content with max number of digits */
export function testMaxDecimalDigits(content: string, maxDigits: number): void {
  const decimal = content.split(".");
  const decimalOnly =
    decimal.length > 1 ? decimal[1].split(" ") : decimal[0].split(" ");

  expect(decimalOnly[0]).to.have.length.of.at.most(maxDigits);
}

/** Click content of a select element */
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

/** Access only metrics by real id */
export function getSelectorByConfig(elementType: string, id: string): string {
  return `${elementType}[id=${id}]`;
}

/** Access testable elements by data-id - attribute */
export function getSelectorByCustomConfig(id: string): string {
  return `[data-id=${id}]`;
}

/** Wait a specified amount of time to let all of the displayed charts render */
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
