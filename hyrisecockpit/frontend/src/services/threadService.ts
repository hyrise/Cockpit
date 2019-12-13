import { Ref, ref } from "@vue/composition-api";
import axios from "axios";

export function useThreadConfigurationService(): {
  threads: Ref<number>;
  setNumberOfThreads: () => void;
  getNumberOfThreads: () => number;
} {
  const threads = ref<number>(getNumberOfThreads());

  function getNumberOfThreads(): number {
    let threads = 0;
    axios.get("http://192.168.30.126:5000/threads").then(response => {
      threads = response.data.threads;
    });
    return threads;
  }

  function setNumberOfThreads(): void {
    axios
      .get("http://192.168.30.126:5000/threads/" + threads.value)
      .then(response => {
        console.log(response.data.threads);
      });
  }

  return { threads, setNumberOfThreads, getNumberOfThreads };
}
