<template>
  <div v-if="$databaseService.isReady.value" class="mx-6">
    <div class="select">
      <v-select
        class="select-box"
        v-model="selectedDatabases"
        v-on:input="handleMaxSelected"
        :items="availableDatabases"
        :error="!selectedDatabases.length"
        chips
        label="databases"
        multiple
        clearable
        deletable-chips
        counter="4"
        outlined
        return-object
        prepend-icon="mdi-database"
      ></v-select>
      <v-select
        class="select-box"
        v-model="selectedMetrics"
        v-on:input="handleMetricsChanged"
        :items="availableMetrics"
        chips
        return-object
        label="metrics"
        multiple
        clearable
        deletable-chips
        :error="!selectedMetrics.length"
        outlined
        prepend-icon="mdi-database"
      ></v-select>
    </div>
  </div>
</template>

<script lang="ts">
import {
  createComponent,
  SetupContext,
  watch,
  computed,
  Ref,
  ref,
  onMounted
} from "@vue/composition-api";
import { getMetricTitle } from "../../meta/metrics";
import { Metric, availableMetrics } from "../../types/metrics";
import { useMetricEvents, useDatabaseEvents } from "../../meta/events";

interface Props {
  metrics: Metric[];
}

interface Data {
  handleMaxSelected: () => void;
  handleMetricsChanged: () => void;
  selectedMetrics: Ref<Object[]>;
  availableMetrics: Object[];
  availableDatabases: Ref<any[]>;
  selectedDatabases: Ref<any[]>;
}

export default createComponent({
  props: {
    metrics: {
      type: Array,
      default: []
    }
  },

  setup(props: Props, context: SetupContext): Data {
    const {
      selectedMetrics,
      availableMetrics,
      handleMetricsChanged
    } = useMetricSelection(props, context);

    onMounted(() => {
      handleMetricsChanged();
    });

    return {
      ...useDatabaseSelection(context),
      selectedMetrics,
      availableMetrics,
      handleMetricsChanged
    };
  }
});

function useMetricSelection(
  props: Props,
  context: SetupContext
): {
  selectedMetrics: Ref<any[]>;
  availableMetrics: any[];
  handleMetricsChanged: () => void;
} {
  const {
    emitMetricsChangedEvent,
    emitSelectedMetricsChangedEvent
  } = useMetricEvents();

  const availableMetrics = props.metrics.map(metric => {
    return { text: getMetricTitle(metric), value: metric };
  });

  const selectedMetrics = ref<any[]>(availableMetrics);
  emitSelectedMetricsChangedEvent(
    selectedMetrics.value.map(metric => metric.value)
  );

  function sortMetrics(): void {
    const sorted: Object[] = [];
    availableMetrics.forEach(metric => {
      const selectedMetric = selectedMetrics.value.find(
        elem => elem === metric
      );
      if (selectedMetric) sorted.push(selectedMetric);
    });
    selectedMetrics.value = sorted;
  }

  function handleMetricsChanged(): void {
    sortMetrics();
    emitMetricsChangedEvent(
      selectedMetrics.value.map((metric: any) => metric.value)
    );
    emitSelectedMetricsChangedEvent(
      selectedMetrics.value.map(metric => metric.value)
    );
  }

  return { availableMetrics, selectedMetrics, handleMetricsChanged };
}

function useDatabaseSelection(
  context: SetupContext
): {
  availableDatabases: Ref<any[]>;
  selectedDatabases: Ref<any[]>;
  handleMaxSelected: () => void;
} {
  const selectedDatabases = ref<any[]>([]);
  const availableDatabases = ref<any[]>([]);
  const { isReady } = context.root.$databaseService;
  const { emitSelectedDatabasesChangedEvent } = useDatabaseEvents();

  watch(isReady, () => {
    if (isReady.value) {
      availableDatabases.value = context.root.$databaseService.databases.value.map(
        database => {
          return { text: database.id, value: database };
        }
      );
      selectedDatabases.value = availableDatabases.value;
      emitSelectedDatabasesChangedEvent(
        selectedDatabases.value.map(database => database.value)
      );
    }
  });
  function handleMaxSelected(): void {
    if (selectedDatabases.value.length > 4) {
      selectedDatabases.value.pop();
    }
    emitSelectedDatabasesChangedEvent(
      selectedDatabases.value.map(database => database.value)
    );
  }
  return { selectedDatabases, availableDatabases, handleMaxSelected };
}
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
  flex: 0 0 42%;
}
.alert {
  margin-top: 1%;
}
</style>
