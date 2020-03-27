export function useFormatting(): {
  formatNumberWithCommas: (data: number) => string;
  formatDateWithoutMilliSec: (date: Date) => Date;
  roundNumber: (
    data: number,
    ratio: number,
    factor?: number,
    even?: boolean
  ) => number;
  formatDateToHHMMSS: (date: Date) => string;
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

  function formatDateToHHMMSS(date: Date): string {
    return date.toLocaleTimeString("de-DE");
  }

  function roundNumber(
    data: number,
    ratio: number,
    factor: number = 1,
    even: boolean = true
  ): number {
    const rounded = Math.floor(data * factor) / ratio;
    return even ? Math.floor(rounded) : rounded;
  }

  return {
    formatNumberWithCommas,
    formatDateWithoutMilliSec,
    roundNumber,
    formatDateToHHMMSS
  };
}
