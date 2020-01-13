import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { QueryResult, QueryData } from "../types/genericQueryData";
import { getEndpoint, getBase } from "./helpers/serviceEndpoints";
import { useDataTransformation } from "./helpers/dataTransformationService";

const fetchingTypeMap = {
  access: "read",
  storage: "read",
  cpu: "modify",
  throughput: "modify"
};

export function useGenericFetchService(
  dataType: string
): {
  getData: () => void;
  data: Ref<QueryData>;
  queryReadyState: Ref<boolean>;
} {
  const queryReadyState = ref<boolean>(true);
  const data = ref<QueryData>({});
  const endpoint = getEndpoint(dataType);
  const base = getBase(dataType);
  const transformData = useDataTransformation(dataType);
  const fetchingType = (fetchingTypeMap as any)[dataType];

  console.log(fetchingType);

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      if (fetchingType === "modify") {
        Object.keys(result).forEach(key => {
          addData(key, transformData(result, key));
        });
      } else if (fetchingType === "read") {
        data.value = result;
      }
      queryReadyState.value = true;
    });
  }

  function addData(dataBaseId: string, newData: number): void {
    if (!data.value[dataBaseId]) {
      data.value[dataBaseId] = [];
    }
    data.value[dataBaseId].push(newData);
    const dataCopy = JSON.parse(JSON.stringify(data.value));
    data.value = dataCopy;
  }

  function fetchData(): Promise<QueryResult> {
    return new Promise((resolve, reject) => {
      axios
        .get(endpoint)
        .then(response => {
          resolve(response.data.body[base]);
        })
        .catch(error => {
          queryReadyState.value = true;
          reject(error);
        });
    });
  }
  return { getData, queryReadyState, data };
}
