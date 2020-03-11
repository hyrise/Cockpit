<template>
  <div>
    <v-card color="primary">
      <v-card-title class="white--text">
        Query details
      </v-card-title>
    </v-card>
    <v-container
      class="grey lighten-5 flex"
      fluid
      justify="center"
      align="center"
    >
      <div v-for="database in databases" :key="database" class="flex-item">
        <query-table
          :database-id="database"
          :queries="queries[database]"
          :loading="loading"
        />
      </div>
    </v-container>
  </div>
</template>

<script lang="ts">
import { defineComponent, SetupContext, Ref, ref } from "@vue/composition-api";
import { DetailedQueryInformation } from "@/types/queries";
import QueryTable from "@/components/QueryTable.vue";
import { useQueryService } from "@/services/queryService";

interface Props {}

interface Data {
  databases: Ref<readonly string[]>;
  queries: Ref<Record<string, DetailedQueryInformation[]>>;
  loading: Ref<boolean>;
}

export default defineComponent({
  components: {
    QueryTable
  },
  setup(props: Props, context: SetupContext): Data {
    const queryService = useQueryService();
    const queries = ref({});
    const loading = ref(true);

    function updateQueryInformation(): void {
      loading.value = true;
      queries.value = {
        added_by_postman: [
          {
            queryName: "TPC-H-5",
            workloadType: "TPC-H",
            latency: 1,
            throughput: 10101
          },
          {
            queryName: "TPC-H-4",
            workloadType: "TPC-H",
            latency: 2,
            throughput: 20202
          }
        ],
        citadelle: [
          {
            queryName: "TPC-H-5",
            workloadType: "TPC-H",
            latency: 1,
            throughput: 10101
          },
          {
            queryName: "TPC-H-4",
            workloadType: "TPC-H",
            latency: 2,
            throughput: 20202
          }
        ]
      };
      loading.value = false;
      //   queryService.getDetailedQueryInformation().then(queryInfo => {
      //     queries.value = queryInfo;
      //   });
    }

    setInterval(updateQueryInformation, 1000);

    return {
      databases: context.root.$databaseController.availableDatabasesById,
      queries,
      loading
    };
  }
});
</script>
<style scoped>
.flex {
  margin-top: 6px;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.flex-item {
  flex: 0 0 49%;
  margin: 5px 0.5% 5px 0.5%;
}
</style>
