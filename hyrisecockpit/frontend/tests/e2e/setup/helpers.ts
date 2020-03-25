import * as faker from "faker";

export function assignFakeData(fakeData: any[]): Object {
  let newData = {};
  fakeData.forEach(data => {
    newData = { ...newData, ...data };
  });
  return newData;
}

export function generateRandomFloat(min: number, range: number) {
  return Math.random() * range + min;
}

export function generateRandomIds(number: number): string[] {
  return [...Array(number).keys()].map(() => faker.random.uuid());
}
