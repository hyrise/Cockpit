<template>
  <v-card>
    <v-card-title>
      <database-chip :database-id="databaseId" />
      <v-spacer />
      <v-text-field
        v-model="searchQueries"
        append-icon="mdi-magnify"
        label="Search queries"
        single-line
        hide-details
      />
    </v-card-title>
    <v-data-table
      :loading="loading"
      :headers="headers"
      :items="sortedQueries"
      :search="searchQueries"
      item-key="queryName"
    />
  </v-card>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed
} from "@vue/composition-api";
import { DetailedQueryInformation } from "@/types/queries";
import DatabaseChip from "@/components/details/DatabaseChip.vue";

interface Props {
  databaseId: string;
  queries: DetailedQueryInformation[];
  loading: boolean;
}

interface Data {
  searchQueries: Ref<string>;
  headers: Object[];
  sortedQueries: Ref<readonly DetailedQueryInformation[]>;
}

export default defineComponent({
  props: {
    queries: {
      type: Array,
      default: () => []
    },
    databaseId: {
      type: String,
      default: null
    },
    loading: {
      type: Boolean,
      default: false
    }
  },
  components: {
    DatabaseChip
  },
  setup(props: Props, context: SetupContext): Data {
    const { sortQueries } = useQuerySorting();

    const headers = [
      {
        text: "Query name",
        align: "start",
        value: "queryName"
      },
      { text: "Workload type", value: "workloadType" },
      { text: "Latency (in ns)", value: "latency" },
      { text: "Throughput (in s)", value: "throughput" }
    ];

    return {
      searchQueries: ref(""),
      headers,
      sortedQueries: computed(() => sortQueries(props.queries))
    };
  }
});

function useQuerySorting(): {
  sortQueries: (
    queries: DetailedQueryInformation[]
  ) => DetailedQueryInformation[];
} {
  function sortQueries(
    queries: DetailedQueryInformation[]
  ): DetailedQueryInformation[] {
    return queries.sort(
      (query1: DetailedQueryInformation, query2: DetailedQueryInformation) =>
        query2.latency - query1.latency
    );
  }

  return { sortQueries };
}
</script>
<style scoped></style>
