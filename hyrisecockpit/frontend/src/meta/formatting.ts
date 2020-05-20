const SEC_PER_DAY = 86400;

export function useFormatting(): {
  formatNumberWithCommas: (data: number) => string;
  formatDateWithoutMilliSec: (date: Date) => Date;
  formatDateWithoutTime: (date: Date) => Date;
  roundNumber: (
    data: number,
    ratio: number,
    factor?: number,
    even?: boolean
  ) => number;
  formatDateToHHMMSS: (date: Date) => string;
  formatDateToNanoSec: (date: Date) => number;
  formatStringsToDate: (dateString: string, timeString: string) => Date;
  addSeconds: (date: Date, seconds: number) => Date;
  subSeconds: (date: Date, seconds: number) => Date;
  subDays: (date: Date, days: number) => Date;
  trimString: (string: string, length: number) => string;
  formatMinutesToSeconds: (minutes: number) => number;
  getNanoSeconds: (seconds: number) => number;
  formatPercentage: (part: number, total: number) => number;
} {
  /* STRINGS */

  function formatNumberWithCommas(data: number): string {
    const parts = data.toString().split(".");
    let formatted = "";
    let index = parts[0].length - 1;
    for (let i = 0; i < parts[0].length; i++) {
      if (i !== 0 && i % 3 == 0) {
        formatted = " " + formatted;
      }
      formatted = parts[0][index] + formatted;
      index--;
    }
    return parts[1] ? formatted + "." + parts[1] : formatted;
  }

  function trimString(string: string, length: number): string {
    return string.length > length
      ? string.substring(0, length - 3) + "..."
      : string;
  }

  /* DATES */

  function formatDateWithoutMilliSec(date: Date): Date {
    date.setMilliseconds(0);
    return date;
  }

  function formatDateWithoutTime(date: Date): Date {
    date.setHours(0, 0, 0, 0);
    return date;
  }

  function addSeconds(date: Date, seconds: number): Date {
    return new Date(date.getTime() + seconds * Math.pow(10, 3));
  }

  function subSeconds(date: Date, seconds: number): Date {
    return new Date(date.getTime() - seconds * Math.pow(10, 3));
  }

  function subDays(date: Date, days: number): Date {
    return new Date(date.getTime() - days * SEC_PER_DAY * Math.pow(10, 3));
  }

  function formatDateToHHMMSS(date: Date): string {
    return date.toLocaleTimeString("de-DE");
  }

  function formatDateToNanoSec(date: Date): number {
    return date.getTime() * Math.pow(10, 6);
  }

  function formatMinutesToSeconds(minutes: number): number {
    return minutes * 60;
  }

  function formatStringsToDate(dateString: string, timeString: string): Date {
    return new Date(`${dateString}T${timeString}`);
  }

  function getNanoSeconds(seconds: number): number {
    return seconds * Math.pow(10, 9);
  }

  /* NUMBERS */

  function roundNumber(
    data: number,
    ratio: number,
    factor: number = 1,
    even: boolean = true
  ): number {
    const rounded = Math.floor(data * factor) / ratio;
    return even ? Math.floor(rounded) : rounded;
  }

  function formatPercentage(part: number, total: number): number {
    return roundNumber(part / total, 100, Math.pow(10, 4), false);
  }

  return {
    formatNumberWithCommas,
    formatDateWithoutMilliSec,
    formatDateWithoutTime,
    roundNumber,
    formatDateToHHMMSS,
    formatDateToNanoSec,
    addSeconds,
    subSeconds,
    subDays,
    trimString,
    formatMinutesToSeconds,
    formatStringsToDate,
    getNanoSeconds,
    formatPercentage,
  };
}

export function useSorting(): {
  sortElements: <T>(selected: T[], available: T[]) => T[];
} {
  function sortElements<T>(selected: T[], available: T[]): T[] {
    const sorted: T[] = [];
    available.forEach((availableElement) => {
      const relatedSelectedElement = selected.find(
        (selectedElement) => selectedElement === availableElement
      );
      if (relatedSelectedElement) sorted.push(relatedSelectedElement);
    });
    return sorted;
  }
  return { sortElements };
}
