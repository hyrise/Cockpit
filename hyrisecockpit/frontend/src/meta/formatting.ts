export function useFormatting(): {
  formatNumberWithCommas: (data: number) => string;
  formatDateWithoutMilliSec: (date: Date) => Date;
} {
  function formatNumberWithCommas(data: number): string {
    const parts = data.toString().split(".");
    let formatted = "";
    let index = parts[0].length - 1;
    for (let i = 0; i < parts[0].length; i++) {
      if (i !== 0 && i % 3 == 0) {
        formatted = "´" + formatted;
      }
      formatted = parts[0][index] + formatted;
      index--;
    }
    return parts[1] ? formatted + "." + parts[1] : formatted;
  }

  function formatDateWithoutMilliSec(date: Date): Date {
    date.setMilliseconds(0);
    return date;
  }

  return { formatNumberWithCommas, formatDateWithoutMilliSec };
}
