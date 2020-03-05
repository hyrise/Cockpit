<template>
  <div class="mx-10 my-10">
    <v-dialog v-model="showDialog" hide-overlay>
      <template v-slot:activator="{ on }">
        <v-btn color="secondary" small right dark v-on="on">
          <v-icon left>mdi-arrow-expand</v-icon> Open detailed view
        </v-btn>
      </template>
      <v-card>
        <v-card-title>Storage</v-card-title>
        <Treemap
          :graph-id="'1' + graphId || 'storage'"
          :storage-data="storageData"
          :chart-configuration="chartConfiguration"
          :autosize="false"
          :selected-databases="selectedDatabases"
        />
        <v-spacer />
        <v-card-actions>
          <v-btn block color="primary" @click="showDialog = false">
            Close detailed view
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <Treemap
      :graph-id="'2' + graphId || 'storage'"
      :storage-data="storageData"
      :chart-configuration="chartConfiguration"
    />
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  Ref,
  ref,
  onMounted
} from "@vue/composition-api";
import Treemap from "../charts/Treemap.vue";
import {
  MetricProps,
  MetricPropsValidation,
  ChartConfiguration,
  StorageData
} from "../../types/metrics";
import { getMetricChartConfiguration } from "../../meta/metrics";

interface Data {
  storageData: Ref<StorageData>;
  chartConfiguration: ChartConfiguration;
  showDialog: Ref<boolean>;
}

export default defineComponent({
  name: "Storage",
  components: {
    Treemap
  },
  props: MetricPropsValidation,
  setup(props: MetricProps, context: SetupContext): Data {
    const data = context.root.$metricController.data[props.metric];
    const showDialog = ref(false);
    const storageData = ref<StorageData>({});

    watch(data, () => {
      if (Object.keys(data.value).length) {
        storageData.value = props.metricMeta.transformationService(
          data.value,
          props.selectedDatabases[0]
        );
      }
    });

    return {
      storageData,
      chartConfiguration: getMetricChartConfiguration(props.metric),
      showDialog
    };
  }
});
</script>
