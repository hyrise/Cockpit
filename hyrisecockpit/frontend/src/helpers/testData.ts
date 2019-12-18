export function useGeneratingTestData(): {
  generateThroughputData: () => number;
  generateStorageData: () => Object[];
  generateCPUData: () => any;
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

  function generateCPUData(): any {
    return {
      system_data: {
        citadelle: {
          cpu: [
            47.7,
            55.6,
            86.4,
            12.6,
            0.2,
            10.3,
            43.7,
            12.1,
            42.3,
            54.5,
            98.6,
            31.6,
            84.7,
            32.6,
            50.8,
            17.0
          ],
          memory: {
            active: 3657117696,
            available: 8467795968,
            buffers: 169537536,
            cached: 4237438976,
            free: 5536755712,
            inactive: 2687451136,
            percent: 32.1,
            shared: 1149366272,
            total: 12469334016,
            used: 2525601792
          }
        },
        york: {
          cpu: [
            44.0,
            87.1,
            42.4,
            41.5,
            6.3,
            53.0,
            82.0,
            94.1,
            77.3,
            15.0,
            2.8,
            72.9,
            48.1,
            86.6,
            36.8,
            90.3
          ],
          memory: {
            active: 3657117696,
            available: 8467795968,
            buffers: 169537536,
            cached: 4237438976,
            free: 5536755712,
            inactive: 2687451136,
            percent: 32.1,
            shared: 1149366272,
            total: 12469334016,
            used: 2525601792
          }
        }
      }
    };
  }

  return { generateThroughputData, generateStorageData, generateCPUData };
}
