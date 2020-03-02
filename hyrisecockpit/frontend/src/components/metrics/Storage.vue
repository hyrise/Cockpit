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
          :labels="labels"
          :parents="parents"
          :values="sizes"
          :chart-configuration="chartConfiguration"
          :autosize="false"
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
      :labels="labels"
      :parents="parents"
      :values="sizes"
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
import * as Plotly from "plotly.js";
import Treemap from "../charts/Treemap.vue";
import { MetricProps, MetricPropsValidation } from "../../types/metrics";

interface Data {
  labels: Ref<string[]>;
  parents: Ref<string[]>;
  sizes: Ref<number[]>;
  chartConfiguration: Ref<string[]>;
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

    const labels = ref<string[]>([]);
    const parents = ref<string[]>([]);
    const sizes = ref<number[]>([]);
    const chartConfiguration = ref<string[]>([props.selectedDatabases[0]]);

    watch(data, () => {
      if (Object.keys(data.value).length) {
        const {
          newLabels,
          newParents,
          newSizes
        } = props.metricMeta.transformationService(
          data.value,
          props.selectedDatabases.map(database => database.id)[0]
        );
        labels.value = newLabels;
        parents.value = newParents;
        sizes.value = newSizes;
      }
    });

    return { labels, parents, sizes, chartConfiguration, showDialog };
  }
});
</script>
