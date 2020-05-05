/** 
detects equality of two different arrays
*/
export function equals<T>(array1: T[], array2: T[]): boolean {
  array1.forEach((table1) =>
    array2.forEach((table2) => {
      if (table1 !== table2) {
        return false;
      }
    })
  );
  return true;
}
