<template>
  <div id="metric-comparison-table" class="metrics-table">
    <div
      class="metrics-column"
      :style="databaseFlex"
      v-for="database in databases"
      :key="database.id"
      :color="database.color"
    >
      <div v-for="metric in selectedMetrics" :key="metric">
        <metric-tile
          class="metric-card"
          :metric="metric"
          :tile-database="database.id"
          :selected-databases="[database.id]"
          :show-details="showDetails"
          :graph-id="`${metric}-${database.id}`"
          :max-chart-width="maxChartWidth"
        />
      </div>
      <v-card tile class="column-bottom-border" :color="database.color"
        ><v-card-text class="white--text">{{
          database.id
        }}</v-card-text></v-card
      >
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  onMounted,
  computed,
  provide,
} from "@vue/composition-api";
import { ContainerProps, ContainerPropsValidation } from "../../types/views";
import { useDatabaseFlex } from "../../meta/components";
import MetricTile from "@/components/container/MetricTile.vue";
import DatabaseSystemDetails from "../../components/details/DatabaseSystemDetails.vue";
import { Database } from "@/types/database";
import { useUpdatingDatabases } from "@/meta/databases";

interface Props {
  selectedDatabases: string[];
}

interface Data {
  databaseFlex: Readonly<Ref<Object>>;
  maxChartWidth: Readonly<Ref<number>>;
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  components: {
    MetricTile,
    DatabaseSystemDetails,
  },
  props: ContainerPropsValidation,
  setup(props: ContainerProps, context: SetupContext): Data {
    const totalViewWidth = ref(0);
    const maxChartWidth = computed(
      () =>
        Math.floor(totalViewWidth.value / props.selectedDatabases.length) - 10
    );
    provide("multipleDatabasesAllowed", false);

    onMounted(() => {
      totalViewWidth.value = document.getElementById(
        "metric-comparison-table"
      )!.offsetWidth;
    });

    return {
      ...useDatabaseFlex(props),
      maxChartWidth,
      ...useUpdatingDatabases(props, context),
    };
  },
});
</script>
<style scoped>
.metrics-table {
  display: flex;
  flex-direction: row;
}
.metrics-column {
  display: flex;
  flex-direction: column;
}
.column-bottom-border {
  margin: 0px 6px 6px 6px;
  border-radius: 0px 0px 4px 4px;
}
</style>
