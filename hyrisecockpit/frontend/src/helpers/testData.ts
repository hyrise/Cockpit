export function useGeneratingTestData(): {
  generateThroughputData: () => number;
  generateStorageData: () => Object;
} {
  function generateRandomNumber(min: number, range: number) {
    return Math.floor(Math.random() * range + min);
  }

  function generateThroughputData(): number {
    return generateRandomNumber(1, 1000);
  }
  function generateStorageData(): Object {
    const json = { "body": 
        { "storage": 
          { "citadelle": //parent
            { "customer": //table
                { "data": 
                        {"c_acctbal": //attribute
                            { "data_type": "float", 
                            "encoding": [ "Dictionary" ], 
                            "size": 589828 }, 
                        "c_address": 
                            { "data_type": "string", 
                            "encoding": [ "Dictionary" ], 
                            "size": 3300064 }, 
                        "c_comment": 
                            { "data_type": "string", 
                            "encoding": [ "Dictionary" ], 
                            "size": 3299864 } 
                        }, 
                "number_columns": 3, 
                "size": 7189756 
                }, 
                
            "lineitem":  
                { "data": 
                        { "l_comment": 
                            { "data_type": "string", 
                            "encoding": [ "LZ4" ], 
                            "size": 29715756 }, 
                        "l_commitdate": 
                            { "data_type": "string", 
                            "encoding": [ "Dictionary" ], 
                            "size": 5504031 }, 
                        "l_discount": 
                            { "data_type": "float", 
                            "encoding": [ "Dictionary" ], 
                            "size": 3002911 } 
                        }, 
                "number_columns": 3, 
                "size": 38222698 
                } 
            } 
        } 
    }, 
"header": { "message": "OK", "status": 200 } 
}
    return json;
      
    
  }

  return { generateThroughputData, generateStorageData };
}
