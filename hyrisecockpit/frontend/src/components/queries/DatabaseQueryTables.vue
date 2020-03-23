<template>
  <div>
    <v-card color="primary">
      <v-card-title class="white--text">
        Detailed query information
      </v-card-title>
    </v-card>
    <v-container
      class="grey lighten-5 flex"
      fluid
      justify="center"
      align="center"
    >
      <query-table
        v-for="database in selectedDatabases"
        :key="database"
        class="flex-item"
        :database-id="database"
        :queries="queries[database]"
        :loading="loading"
      />
    </v-container>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  onUnmounted
} from "@vue/composition-api";
import { DetailedQueryInformation } from "@/types/queries";
import QueryTable from "@/components/queries/QueryTable.vue";
import { useQueryService } from "@/services/queryService";

interface Props {
  selectedDatabases: string[];
}

interface Data {
  queries: Ref<Record<string, DetailedQueryInformation[]>>;
  loading: Ref<boolean>;
}

export default defineComponent({
  components: {
    QueryTable
  },
  props: {
    selectedDatabases: {
      type: Array,
      default: () => []
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const queryService = useQueryService();
    const queries = ref({});
    const loading = ref(true);

    updateQueryInformation();

    function updateQueryInformation(): void {
      loading.value = true;
      queryService.getDetailedQueryInformation().then(queryInfo => {
        queries.value = queryInfo;
        loading.value = false;
      });
    }

    const intervalId = setInterval(updateQueryInformation, 5000);

    onUnmounted(() => {
      clearInterval(intervalId);
    });

    return {
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
