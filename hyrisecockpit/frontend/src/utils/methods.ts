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

/** 
detects ivalid dates or time strings
*/
export function isValidDate(value: string): boolean {
  if (value.split(":").some((item) => item.length < 2)) return false;

  const hour = parseInt(value.split(":")[0], 10);
  const minute = parseInt(value.split(":")[1], 10);
  return (
    !isNaN(Date.parse(value)) ||
    (hour >= 0 && hour < 24 && minute >= 0 && minute < 60)
  );
}
