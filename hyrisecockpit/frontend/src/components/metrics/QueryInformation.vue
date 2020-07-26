<template>
  <v-card data-id="query-table" class="mx-3 mt-n5" flat :min-height="minHeight">
    <v-card-title>
      <v-text-field
        v-model="searchQueries"
        append-icon="mdi-magnify"
        label="Search queries"
        single-line
        hide-details
        data-id="query-search-input"
      />
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="displayedQueries"
      :search="searchQueries"
      item-key="queryNumber"
      data-id="query-data-table"
    />
  </v-card>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed,
} from "@vue/composition-api";
import { useFormatting } from "@/meta/formatting";
import {
  MetricProps,
  MetricPropsValidation,
  BasicChartComponentData,
} from "@/types/metrics";
import { getMetricMetadata } from "@/meta/metrics";

interface Data {
  searchQueries: Ref<string>;
  headers: Object[];
  displayedQueries: Ref<readonly DisplayedQueryInformation[]>;
  minHeight: Ref<string>;
}

type DetailedQueryInformation = {
  queryNumber: string;
  workloadType: string;
  latency: number;
  throughput: number;
};

type DisplayedQueryInformation = {
  queryNumber: string;
  workloadType: string;
  latency: string;
  throughput: number;
};

export default defineComponent({
  props: MetricPropsValidation,
  name: "QueryInformation",
  setup(props: MetricProps, context: SetupContext): Data {
    const { formatDisplayedQueries } = useQueryFormatting();
    const metric = getMetricMetadata(props.metric);
    const data = computed((): DetailedQueryInformation[] =>
      metric.transformationService(
        context.root.$metricController.data[props.metric].value,
        props.selectedDatabases[0]
      )
    );

    return {
      searchQueries: ref(""),
      headers: [
        {
          text: "Query number",
          align: "start",
          value: "queryNumber",
        },
        { text: "Workload type", value: "workloadType" },
        { text: "Average latency (in ms)", value: "latency" },
        { text: "Average throughput (in q/s)", value: "throughput" },
      ],
      displayedQueries: computed(() => formatDisplayedQueries(data.value)),
      minHeight: computed(
        () =>
          /** add basic table height and slot height * number of max queries to ensure min height */
          `${
            context.root.$metricController.maxValueData.queryInformation.value *
              48 +
            218
          }`
      ),
    };
  },
});

function useQueryFormatting(): {
  formatDisplayedQueries: (
    queries: DetailedQueryInformation[]
  ) => DisplayedQueryInformation[];
} {
  const { formatNumberWithCommas } = useFormatting();

  function sortQueries(
    queries: DetailedQueryInformation[]
  ): DetailedQueryInformation[] {
    return queries.sort(
      (query1: DetailedQueryInformation, query2: DetailedQueryInformation) =>
        query2.latency - query1.latency
    );
  }

  function formatDisplayedQueries(
    queries: DetailedQueryInformation[]
  ): DisplayedQueryInformation[] {
    return sortQueries(queries).map((query) => {
      return { ...query, latency: formatNumberWithCommas(query.latency) };
    });
  }

  return { formatDisplayedQueries };
}
</script>
