<template>
  <div class="treemap">
    <canvas id="treemap"></canvas></div
></template>

<script lang="ts">
import Chart from 'chart.js';
import 'chartjs-chart-treemap';
import axios from 'axios';
import {
  createComponent,
  SetupContext,
  onMounted,
  watch,
  Ref,
  ref,
} from '@vue/composition-api';
import { useGeneratingTestData } from '../helpers/testData';

interface Props {}

export default createComponent({
  setup(props: Props, context: SetupContext) {
    const treeMap = ref<Object>(null);
    const { treeData, getStorageData } = useStorageFetching();
    const { generateStorageData } = useGeneratingTestData();
    const testData = generateStorageData();

    function updateTreeMap() {
      //getStorageData();
      treeMap.value.update();
    }

    onMounted(() => {
      const canvas: any = document.getElementById('treemap');
      const map: any = canvas.getContext('2d');
      treeMap.value = new Chart(map, {
        type: 'treemap',
        data: {
          datasets: [
            {
              label: 'Basic treemap',
              tree: testData, //treeData.value,
              key: 'size',
              groups: ['table', 'column'],
              spacing: 1,
              borderWidth: 1.5,
              borderColor: '#f0ffff',
              fontColor: 'white',
              fontFamily: 'sans-serif',
              fontSize: 16,
              fontStyle: 'normal',
              hoverBackgroundColor: '#D3D3D3',
              backgroundColor: function(map) {
                const item = map.dataset.data[map.dataIndex];
                if (item != undefined) {
                  switch (item.l) {
                    case 0:
                      switch (item.g) {
                        case 'lineitem':
                          return '#0063c8';
                        case 'orders':
                          return '#0070e1';
                        case 'partsupp':
                          return '#007cfb';
                        case 'customer':
                          return '#1589ff';
                        case 'part':
                          return '#2f96ff';
                        case 'supplier':
                          return '#62b0ff';
                        case 'nation':
                          return '#76baff';
                        case 'region':
                          return '#afd6ff';
                      }
                  }
                } else return null;
              },
            },
          ],
        },
        options: {
          maintainAspectRatio: true,
          title: {
            display: true,
            text: 'Hyrise Storage',
            fontSize: 26,
          },
          legend: {
            display: false,
          },
          tooltips: {
            titleFontSize: 16,
            bodyFontSize: 14,
            callbacks: {
              title: function(item, data) {
                const itemDate = item[0];
                return data.datasets[itemDate.datasetIndex].data[itemDate.index]
                  .g;
              },
              label: function(item, data) {
                const dataset = data.datasets[item.datasetIndex];
                const dataItem = dataset.data[item.index];
                return dataset.key + ': ' + dataItem.v;
              },
              afterLabel: function(item, data) {
                const dataset = data.datasets[item.datasetIndex];
                const dataItem = dataset.data[item.index];
                const entry = dataItem._data.children[0];
                switch (dataItem.l) {
                  case 1:
                    return (
                      'encoding' +
                      ': ' +
                      entry.encoding +
                      '\n' +
                      'data type' +
                      ': ' +
                      entry.dataType
                    );
                  case 0:
                    return null;
                }
              },
            },
          },
        },
      });
      //setInterval(updateTreeMap, 1000);
    });
  },
});
function useStorageFetching(): {
  treeData: Ref<Object[]>;
  getStorageData: () => void;
} {
  const treeData = ref<Object[]>([]);
  function getStorageData() {
    fetchStorageData().then(result => {
      const currentData = transformDataFormat(result);
      updateChartData(currentData);
    });
  }

  function fetchStorageData(): Promise<Object> {
    return new Promise((resolve, reject) => {
      axios
        .get('http://192.168.30.126:5000/columninfo')
        .then(response => {
          resolve(response.data);
        })
        .catch(error => {
          reject(error);
        });
    });
  }

  function transformDataFormat(data: Object) {
    const dataArray = [];
    const tableData = data['columninfo'];
    for (let i = 0; i < tableData.length; i++) {
      const columnData = tableData[i];
      const entry = {};
      entry['table'] = columnData[0];
      entry['column'] = columnData[1];
      entry['size'] = columnData[2];
      entry['dataType'] = columnData[3];
      entry['encoding'] = columnData[4];
      dataArray.push(entry);
    }
    return dataArray;
  }

  function updateChartData(newData: Object[]) {
    treeData.value.length = 0;
    for (let i = 0; i < newData.length; i++) {
      treeData.value.push(newData[i]);
    }
  }
  return { getStorageData, treeData };
}
</script>
<style>
.treemap {
  max-width: 1600px;
  max-height: 800px;
}
</style>
