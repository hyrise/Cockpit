<template>
  <div class="treemap mx-10 my-10">
    <div id="treemap">
    </div>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  onMounted,
  watch,
  Ref,
  ref
} from "@vue/composition-api";
import { useGeneratingTestData } from "../helpers/testData";
import { StorageQueryResult } from "../types/storage";
import { useStorageFetchService } from "../services/storageService";
import * as Plotly from "plotly.js";


interface Props {}

export default createComponent({
  setup(props: Props, context: SetupContext) {
    const treeMap = ref<Object>(null);
    const { storageData, getStorage } = useStorageFetchService();
    const { generateStorageData } = useGeneratingTestData();
    const testData = generateStorageData();
    

    const labels = ['hyrise' ,...testData.map(entry => entry.table),...testData.map(entry => entry.column)];
    const parents = [ "" ,...testData.map(entry => "hyrise"),...testData.map(entry => entry.table)];
    const sizes = [0, ...testData.map(entry => 0)  ,...testData.map(entry => entry.size)];
    

    const data:any = [{
      type: "treemap",
      labels: labels,
      parents: parents,
      values:  sizes,
      textinfo: "label+value+percent parent+percent entry",
      outsidetextfont: {"size": 20, "color": "#377eb8"},
      marker: {"line": {"width": 2}},
      pathbar: {"visible": false}
    }];

      var layout = {
        autosize: false,
        width: 1200,
        height: 900};

    onMounted(() => {
       console.log(labels,parents,sizes)
       Plotly.newPlot('treemap', data, layout)
    });

    }
});
  
  
</script>
<style>
.treemap {
    width: 100%;
    
  }
</style>
