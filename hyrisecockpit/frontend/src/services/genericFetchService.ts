import { Ref, ref } from "@vue/composition-api";
import axios from "axios";
import { QueryResult, QueryData } from "../types/genericQueryData";
import { getEndpoint } from "./helpers/serviceEndpoints";

export function useGenericFetchService(
  dataType: string
): {
  getData: () => void;
  data: Ref<QueryData>;
  queryReadyState: Ref<boolean>;
} {
  const queryReadyState = ref<boolean>(true);
  const data = ref<QueryData>({ citadelle: [11, 22, 2], york: [11, 0, 9] });
  const endpoint = getEndpoint(dataType);

  function getData(): void {
    queryReadyState.value = false;
    fetchData().then(result => {
      Object.keys(result).forEach(key => {
        addData(key, result[key][1]);
      });
      queryReadyState.value = true;
    });
  }

  function addData(dataBaseId: string, newData: number): void {
    if (!data.value[dataBaseId]) {
      data.value[dataBaseId] = [];
    }
    data.value[dataBaseId].push(newData);
  }

  function fetchData(): Promise<QueryResult> {
    return new Promise((resolve, reject) => {
      axios
        .get(endpoint)
        .then(response => {
          resolve(response.data.body);
        })
        .catch(error => {
          reject(error);
        });
    });
  }
  return { getData, queryReadyState, data };
}
