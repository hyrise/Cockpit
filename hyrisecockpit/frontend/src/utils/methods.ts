/* ARRAYS */

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

/* DATES */
const DEFAULT_DATE = "2000-01-01";

/** 
detects invalid date or time strings
*/
export function isInvalidDateTimeString(value: string): boolean {
  /* check invalid date string */
  if (value.split("-").length === 3) {
    return isNaN(Date.parse(value));
  }

  /* check invalid time string */
  if (value.split(":").length === 2) {
    return isNaN(Date.parse(`${DEFAULT_DATE}T${value}`));
  }

  return true;
}

/**
 * detects future dates and accepts possible offset in seconds
 */
export function isInFuture(date: Date, offset = 0): boolean {
  return date.getTime() - offset * Math.pow(10, 3) >= new Date().getTime();
}

/**
 * detects past time strings depending on base time
 */
export function isInPast(
  baseTimeString: string,
  newTimeString: string
): boolean {
  return (
    new Date(`${DEFAULT_DATE}T${baseTimeString}`).getTime() >
    new Date(`${DEFAULT_DATE}T${newTimeString}`).getTime()
  );
}
