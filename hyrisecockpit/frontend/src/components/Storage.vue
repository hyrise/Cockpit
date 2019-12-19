<template>
  <div class="treemap mx-10 my-10">
    <Treemap
      graph-id="treemap"
      :labels="labels"
      :parents="parents"
      :values="sizes"
      :chart-configuration="chartConfiguration"
    />
  </div>
</template>

<script lang="ts">
// TODO: refactor to generic treemap component, getting data via props from storage component

import {
  createComponent,
  SetupContext,
  onMounted,
  watch,
  Ref,
  ref,
  computed
} from "@vue/composition-api";
import { StorageQueryResult } from "../types/storage";
import { useStorageFetchService } from "../services/storageService";
import * as Plotly from "plotly.js";
import { useGeneratingTestData } from "../helpers/testData";
import Treemap from "./charts/Treemap.vue";

interface Props {}

interface Data {
  labels: Ref<string[]>;
  parents: Ref<string[]>;
  sizes: Ref<number[]>;
  chartConfiguration: Ref<string[]>;
}

export default createComponent({
  components: {
    Treemap
  },
  setup(props: Props, context: SetupContext): Data {
    const { storageData, getStorage } = useStorageFetchService();
    const { generateStorageData } = useGeneratingTestData();
    let localStorage = ref<Object>(null);
    setInterval(addData, 2000);

    function addData() {
      console.log("add");
      localStorage.value = generateStorageData();
    }

    const labels = ref<string[]>([]);
    const parents = ref<string[]>([]);
    const sizes = ref<number[]>([]);
    const chartConfiguration = ref<string[]>(["citadelle"]);

    watch(localStorage, () => {
      if (localStorage.value) {
        const { newLabels, newParents, newSizes } = calculateData();
        labels.value = newLabels;
        parents.value = newParents;
        sizes.value = newSizes;
      }
    });

    function calculateData(): {
      newLabels: string[];
      newParents: string[];
      newSizes: number[];
    } {
      const newLabels: string[] = [];
      const newParents: string[] = [];
      const newSizes: number[] = [];

      Object.keys(localStorage.value.body.storage).forEach(instance => {
        newLabels.push(instance);
        newParents.push("");
        newSizes.push(0);
        Object.keys(localStorage.value.body.storage[instance]).forEach(
          table => {
            newLabels.push(instance + "_" + table);
            newParents.push(instance);
            newSizes.push(0);
            Object.keys(
              localStorage.value.body.storage[instance][table].data
            ).forEach(attribute => {
              newLabels.push(instance + "_" + attribute);
              newParents.push(instance + "_" + table);
              newSizes.push(
                localStorage.value.body.storage[instance][table].data[attribute]
                  .size
              );
            });
          }
        );
      });
      return { newLabels, newParents, newSizes };
    }
    return { labels, parents, sizes, chartConfiguration };
  }
});
</script>
<style>
.treemap {
  width: 100%;
}
</style>
