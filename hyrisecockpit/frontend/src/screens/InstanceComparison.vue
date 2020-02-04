<template>
  <div class="mx-6">
    <div class="select">
      <v-select
        v-if="$databaseData.isReady"
        class="select-box"
        v-model="watchedInstances"
        v-on:input="handleMaxSelected"
        :items="$databaseData.databases.value.map(database => database.id)"
        chips
        label="databases"
        multiple
        counter="4"
        outlined
        prepend-icon="mdi-database"
      ></v-select>
      <v-select
        v-if="$databaseData.isReady"
        class="select-box"
        v-model="selectedMetrics"
        :items="comparisonMetrics"
        chips
        label="metrics"
        multiple
        outlined
        prepend-icon="mdi-database"
      ></v-select>
    </div>
    <MetricsComparisonTable
      :selected-databases="watchedInstances"
      :selected-metrics="selectedMetrics"
      :show-details="true"
    />
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  watch,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import MetricsComparisonTable from "../components/container/MetricsComparisonTable.vue";
import { Metric, comparisonMetrics } from "../types/metrics";
import { ScreenData } from "../types/screens";

interface Data extends ScreenData {
  handleMaxSelected: () => void;
  selectedMetrics: Ref<string[]>;
  comparisonMetrics: Metric[];
}

export default createComponent({
  components: {
    MetricsComparisonTable
  },
  setup(props: {}, context: SetupContext): Data {
    const watchedInstances = ref<string[]>([]);
    const selectedMetrics = ref<string[]>(comparisonMetrics);

    const { isReady } = context.root.$databaseData;
    watch(isReady, () => {
      if (isReady.value) {
        watchedInstances.value = context.root.$databaseData.databases.value.map(
          database => database.id
        );
      }
    });

    function handleMaxSelected() {
      if (watchedInstances.value.length > 4) {
        watchedInstances.value.pop();
      }
    }
    return {
      watchedInstances,
      handleMaxSelected,
      selectedMetrics,
      comparisonMetrics
    };
  }
});
</script>
<style scoped>
.select {
  display: flex;
  flex-direction: row;
  margin-top: 2%;
  margin-bottom: 1%;
}
.select-box {
  margin: 0px 20px 10px 20px;
}
</style>
