<template>
  <div class="treemap mx-10 my-10">
    <div id="treemap"></div>
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

    const hyriseInstances = Object.keys(testData.body.storage);

    const tables = [];
    const attributes = [];
    const attributesSize = [];
    hyriseInstances.forEach(element => {
      const tablesPerInstance =  Object.keys(testData.body.storage[element]);
      tables.push(tablesPerInstance);
      });
    hyriseInstances.forEach(element => {
       tables.forEach(tablesPerInstance => {
         tablesPerInstance.forEach(table => {
          const attribute = Object.keys(testData.body.storage[element][table].data);
          attributes.push(attribute);
          attribute.forEach(attr =>  attributesSize.push(testData.body.storage[element][table].data[attr].size));
         });
  
      });
    });

    const tablesFlat = tables.flat();
    const attrFlat = attributes.flat();

    const labels = [
      ...hyriseInstances,
      ...tables,
      ...attributes,
    ];
    const parents = [
      ...hyriseInstances.map(entry => ""),
      ...tablesFlat.map((tablesPerInstance,index) => hyriseInstances[index] ),
      ...attrFlat.map((attributesPerTable,index) => tablesFlat[index])
    ];
    const sizes = [
      ...hyriseInstances.map(entry => 0),
      ...tables.map(entry => 0),
      ...attributesSize,
    ];
    
    console.log(labels.flat(), 'labels');
    console.log(parents.flat(), 'p');
    console.log(sizes, 's');
    const data: any = [
      {
        type: "treemap",
        labels: labels.flat(),
        parents: parents.flat(),
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

    onMounted(() => {
      Plotly.newPlot("treemap", data, layout);
    });
  }
});
</script>
<style>
.treemap {
  width: 100%;
}
</style>
