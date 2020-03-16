<template>
  <div v-if="$databaseController.databasesUpdated.value">
    <v-expansion-panels>
      <v-expansion-panel>
        <v-expansion-panel-header class="title grey darken-3--text">
          Selection
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <div class="select">
            <v-select
              class="select-box"
              v-model="selectedDatabases"
              v-on:input="handleDatabasesChanged"
              :items="availableDatabases"
              :error="!selectedDatabases.length"
              chips
              label="databases"
              multiple
              clearable
              deletable-chips
              counter="4"
              outlined
              prepend-icon="mdi-database"
            />
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
            /></div
        ></v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
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
  handleDatabasesChanged: () => void;
  handleMetricsChanged: () => void;
  selectedMetrics: Ref<Object[]>;
  availableMetrics: Object[];
  availableDatabases: Ref<any[]>;
  selectedDatabases: Ref<any[]>;
}

export default defineComponent({
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
    emitWatchedMetricsChangedEvent,
    emitSelectedMetricsChangedEvent
  } = useMetricEvents();
  const { sortElements } = useSorting();

  const availableMetrics = props.metrics.map(metric => {
    return { text: getMetricTitle(metric), value: metric };
  });

  const selectedMetrics = ref<any[]>(availableMetrics);
  emitSelectedMetricsChangedEvent(
    selectedMetrics.value.map(metric => metric.value)
  );

  function handleMetricsChanged(): void {
    selectedMetrics.value = sortElements(
      selectedMetrics.value,
      availableMetrics
    );
    emitWatchedMetricsChangedEvent(
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
  availableDatabases: Ref<string[]>;
  selectedDatabases: Ref<string[]>;
  handleDatabasesChanged: () => void;
} {
  const selectedDatabases = ref<string[]>([]);
  const availableDatabases = ref<string[]>([]);
  const { databasesUpdated } = context.root.$databaseController;
  const { emitSelectedDatabasesChangedEvent } = useDatabaseEvents();
  const { sortElements } = useSorting();

  watch(databasesUpdated, () => {
    if (databasesUpdated.value) {
      availableDatabases.value = context.root.$databaseController
        .availableDatabasesById.value as string[];

      selectedDatabases.value = availableDatabases.value;
      emitSelectedDatabasesChangedEvent(selectedDatabases.value);
    }
  });

  function handleDatabasesChanged(): void {
    if (selectedDatabases.value.length > 4) {
      selectedDatabases.value.pop();
    }
    selectedDatabases.value = sortElements(
      selectedDatabases.value,
      availableDatabases.value
    ) as string[];
    emitSelectedDatabasesChangedEvent(selectedDatabases.value);
  }
  return { selectedDatabases, availableDatabases, handleDatabasesChanged };
}

function useSorting(): {
  sortElements: (
    selected: string[] | Object[],
    available: string[] | Object[]
  ) => string[] | Object[];
} {
  function sortElements(
    selected: string[] | Object[],
    available: string[] | Object[]
  ): string[] | Object[] {
    const sorted: string[] | Object[] = [];
    available.forEach(availableElement => {
      const relatedSelectedElement = selected.find(
        selectedElement => selectedElement === availableElement
      );
      if (relatedSelectedElement) sorted.push(relatedSelectedElement as any);
    });
    return sorted;
  }

  return { sortElements };
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
