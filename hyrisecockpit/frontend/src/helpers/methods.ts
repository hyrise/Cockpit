export function equals(array1: string[], array2: string[]): boolean {
  array1.forEach((table1) =>
    array2.forEach((table2) => {
      if (table1 !== table2) {
        return false;
      }
    })
  );
  return true;
}

export const isInTestMode: boolean = (window as any).Cypress;
