export function useGeneratingTestData(): {
  generateThroughputData: () => number;
  generateStorageData: () => Object[];
} {
  function generateRandomNumber(min: number, range: number) {
    return Math.floor(Math.random() * range + min);
  }

  function generateThroughputData(): number {
    return generateRandomNumber(1, 1000);
  }
  function generateStorageData(): Object[] {
    return [
      {
        table: "lineitem",
        column: "column",
        size: generateRandomNumber(90000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "orders",
        column: "column",
        size: generateRandomNumber(80000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "partsupp",
        column: "column",
        size: generateRandomNumber(70000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "customer",
        column: "column",
        size: generateRandomNumber(60000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "part",
        column: "column",
        size: generateRandomNumber(50000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "supplier",
        column: "column",
        size: generateRandomNumber(40000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "nation",
        column: "column",
        size: generateRandomNumber(30000, 10000),
        dataType: "int",
        encoding: "encoding"
      },
      {
        table: "region",
        column: "column",
        size: generateRandomNumber(10000, 10000),
        dataType: "int",
        encoding: "encoding"
      }
    ];
  }

  return { generateThroughputData, generateStorageData };
}
