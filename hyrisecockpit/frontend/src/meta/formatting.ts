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
  formatDateToNanoSec: (date: Date) => number;
  addSeconds: (date: Date, seconds: number) => Date;
  subSeconds: (date: Date, seconds: number) => Date;
  formatMinutesToSeconds: (minutes: number) => number;
  getNanoSeconds: (seconds: number) => number;
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

  function addSeconds(date: Date, seconds: number): Date {
    return new Date(date.getTime() + seconds * Math.pow(10, 3));
  }

  function subSeconds(date: Date, seconds: number): Date {
    return new Date(date.getTime() - seconds * Math.pow(10, 3));
  }

  function formatDateToHHMMSS(date: Date): string {
    return date.toLocaleTimeString("de-DE");
  }

  function formatDateToNanoSec(date: Date): number {
    return date.getTime() * Math.pow(10, 6);
  }

  function getNanoSeconds(seconds: number): number {
    return seconds * Math.pow(10, 9);
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

  function formatMinutesToSeconds(minutes: number): number {
    return minutes * 60;
  }

  return {
    formatNumberWithCommas,
    formatDateWithoutMilliSec,
    roundNumber,
    formatDateToHHMMSS,
    formatDateToNanoSec,
    addSeconds,
    subSeconds,
    formatMinutesToSeconds,
    getNanoSeconds,
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
