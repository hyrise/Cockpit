<template>
  <div class="treemap mx-10 my-10">
    <div id="treemap"></div>
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

interface Props {}

export default createComponent({
  setup(props: Props, context: SetupContext) {
    const { storageData, getStorage } = useStorageFetchService();
    const localStorage = computed(() => storageData.value) ;
    console.log(localStorage, 'local');
    let flag = false;
    const labels: string[] = [];
    const parents: string[] = [];
    const sizes: number[] = [];

    function calculateData(): void {
  

    Object.keys(localStorage.value.body.storage).forEach(instance => {
      labels.push(instance);
      parents.push("");
      sizes.push(0);
      Object.keys(localStorage.value.body.storage[instance]).forEach(table => {
        labels.push(instance+'_'+table);
        parents.push(instance);
        sizes.push(0);
        Object.keys(localStorage.value.body.storage[instance][table].data).forEach(
          attribute => {
            labels.push(instance+'_'+attribute);
            parents.push(instance+'_'+table);
            sizes.push(
              localStorage.value.body.storage[instance][table].data[attribute].size
            );
          }
        );
      });
    });

    
    }
    function getTreemap(){
      if(localStorage.value && !flag){
        calculateData();
        console.log(labels,parents,sizes);
        const data: any = [
      {
        type: "treemap",
        labels: labels,
        parents: parents,
        values: sizes,
        textinfo: "label+value+percent parent+percent entry",
        outsidetextfont: { size: 20, color: "#377eb8" },
        marker: { line: { width: 2 } },
        pathbar: { visible: false }
      }
    ];

    var layout = {
      autosize: false,
      width: 1200,
      height: 900
    };
     Plotly.newPlot("treemap", data, layout);
     flag=true;
      }
    }
    

    onMounted(() => {
     setInterval(getTreemap, 1000)
    });
  }
});
</script>
<style>
.treemap {
  width: 100%;
}
</style>
