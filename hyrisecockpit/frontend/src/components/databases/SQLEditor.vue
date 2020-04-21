<template>
  <v-card>
    <v-card-title>
      Send Sql to DB
    </v-card-title>
    <v-card-text>
      <v-textarea
        name="input-7-1"
        filled
        auto-grow
        v-model="sqlQuery"
        :error-messages="error"
        :loading="isLoading"
      ></v-textarea>
      <s-q-l-result-table :rows="rows" :columnNames="columnNames" />
    </v-card-text>
    <v-card-actions>
      <v-spacer />
      <v-btn @click="sendSQLQuery()" color="primary" text
        >send Query to DB</v-btn
      >
    </v-card-actions>
  </v-card>
</template>

<script lang="ts">
import {
  SetupContext,
  defineComponent,
  ref,
  Ref,
  computed,
} from "@vue/composition-api";
import { useDatabaseService } from "../../services/databaseService";
import SQLResultTable from "./SQLResultTable.vue";

interface Data {
  sqlQuery: Ref<string>;
  sendSQLQuery: () => void;
  error: Ref<string>;
  isLoading: Ref<boolean>;
  rows: Ref<[]>;
  columnNames: Ref<String[]>;
}

interface Props {
  databaseId: string;
}

export default defineComponent({
  components: {
    SQLResultTable,
  },
  props: {
    databaseId: {
      type: String,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const sqlQuery = ref<string>("");
    const { postSQLQuery } = useDatabaseService();
    const error = ref<string>("");
    const isLoading = ref<boolean>(false);
    const rows = ref<[]>([]);
    const columnNames = ref<string[]>([]);

    function sendSQLQuery() {
      isLoading.value = true;
      postSQLQuery(props.databaseId, sqlQuery.value)
        .then((result) => {
          if (result.data.successful) {
            error.value = "";
            rows.value = result.data.results;
            columnNames.value = result.data.col_names;
          } else {
            error.value = result.data.error_message;
          }
          isLoading.value = false;
        })
        .catch((error) => {
          error.value = error;
          isLoading.value = false;
        });
      console.log(props.databaseId, sqlQuery.value);
    }

    return {
      sqlQuery,
      sendSQLQuery,
      error,
      isLoading,
      rows,
      columnNames,
    };
  },
});
</script>
<style scoped>
.list {
  z-index: 12;
}
.button {
  margin-right: 10px;
  margin-left: 10px;
}
.header {
  padding: 5px !important;
  margin-left: 10px !important;
  align-content: center;
  justify-content: center;
}
</style>
