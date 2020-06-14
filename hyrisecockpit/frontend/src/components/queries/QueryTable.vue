<template>
  <v-card data-id="query-table">
    <v-card-title>
      <database-chip :database-id="databaseId" />
      <v-spacer />
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
      :loading="loading"
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
import {
  DetailedQueryInformation,
  DisplayedQueryInformation,
} from "@/types/queries";
import DatabaseChip from "@/components/details/DatabaseChip.vue";
import { useFormatting } from "@/meta/formatting";

interface Props {
  databaseId: string;
  queries: DetailedQueryInformation[];
  loading: boolean;
}

interface Data {
  searchQueries: Ref<string>;
  headers: Object[];
  displayedQueries: Ref<readonly DisplayedQueryInformation[]>;
}

export default defineComponent({
  props: {
    queries: {
      type: Array,
      default: () => [],
    },
    databaseId: {
      type: String,
      default: null,
    },
    loading: {
      type: Boolean,
      default: false,
    },
  },
  components: {
    DatabaseChip,
  },
  setup(props: Props, context: SetupContext): Data {
    const { formatDisplayedQueries } = useQueryFormatting();

    const headers = [
      {
        text: "Query number",
        align: "start",
        value: "queryNumber",
      },
      { text: "Workload type", value: "workloadType" },
      { text: "Average latency (in ms)", value: "latency" },
      { text: "Average throughput (in q/s)", value: "throughput" },
    ];

    return {
      searchQueries: ref(""),
      headers,
      displayedQueries: computed(() => formatDisplayedQueries(props.queries)),
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
