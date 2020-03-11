<template>
  <v-card>
    <v-card-title>
      <database-chip :database="database" />
      <v-spacer></v-spacer>
      <v-text-field
        v-model="searchQueries"
        append-icon="mdi-magnify"
        label="Search Queries"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :loading="loading"
      :headers="headers"
      :items="sortedQueries"
      :search="searchQueries"
      item-key="queryName"
    ></v-data-table>
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
import { Database } from "@/types/database";

interface Props {
  databaseId: string;
  queries: DetailedQueryInformation[];
  loading: boolean;
}

interface Data {
  searchQueries: Ref<string>;
  headers: Object[];
  sortedQueries: Ref<readonly DetailedQueryInformation[]>;
  database: Ref<Database>;
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

    const sortedQueries = computed(() => sortQueries(props.queries));
    return {
      searchQueries: ref(""),
      headers,
      sortedQueries,
      database: ref(
        context.root.$databaseController.getDatabasesByIds([
          props.databaseId
        ])[0] //TODO: refactor this: add reutn of just one database in controller
      )
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
