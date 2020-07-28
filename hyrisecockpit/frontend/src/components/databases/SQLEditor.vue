<template>
  <v-dialog v-model="showDialog" width="60%">
    <template v-slot:activator="{ on }">
      <v-btn
        data-id="open-sql-dialog"
        v-on="on"
        depressed
        medium
        height="32"
        width="30"
      >
        <v-icon class="mr-2" color="primary" size="18">mdi-file-edit</v-icon>
        <div class="text font-weight-regular">SQL</div>
      </v-btn>
    </template>
    <v-card>
      <v-system-bar :height="50" class="sql-header">
        <v-card-title class="subtitle-1">SQL-interface</v-card-title>
        <v-spacer />
        <v-icon
          @click="showDialog = false"
          color="primary"
          text
          data-id="close-sql-dialog"
          >mdi-close
        </v-icon>
      </v-system-bar>
      <v-card-text>
        <v-textarea
          v-model="sqlQuery"
          filled
          auto-grow
          :error-messages="error"
          :loading="isLoading"
          placeholder="insert SQL here"
          data-id="sql-input"
        ></v-textarea>
        <s-q-l-result-table :rows="rows" :columnNames="columnNames" />
      </v-card-text>
      <v-card-actions class="justify-center pt-0">
        <v-btn
          @click="sendSQLQuery()"
          class="secondary primary--text my-2"
          text
          data-id="send-sql-input"
          >send query</v-btn
        >
      </v-card-actions>
    </v-card>
  </v-dialog>
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
  showDialog: Ref<boolean>;
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
    const showDialog = ref<boolean>(false);

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
    }

    return {
      sqlQuery,
      sendSQLQuery,
      error,
      isLoading,
      rows,
      columnNames,
      showDialog,
    };
  },
});
</script>
<style scoped>
.sql-header {
  margin-bottom: 16px;
}
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
