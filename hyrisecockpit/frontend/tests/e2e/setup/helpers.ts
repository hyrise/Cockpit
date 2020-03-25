export function assignFakeData(fakeData: any[]): Object {
  let newData = {};
  fakeData.forEach(data => {
    newData = { ...newData, ...data };
  });
  return newData;
}
