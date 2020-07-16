<template>
  <v-dialog v-model="open" persistent max-width="600px">
    <v-card data-id="add-database">
      <v-card-title>
        <span class="headline">Add new database</span>
      </v-card-title>
      <v-card-text class="pb-0">
        <v-row>
          <v-col cols="6">
            <v-text-field
              v-model="host"
              label="Host"
              data-id="host-input"
            ></v-text-field>
          </v-col>
          <v-col cols="6">
            <v-text-field
              v-model="id"
              label="ID"
              :error-messages="idError"
              data-id="id-input"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="6">
            <v-text-field
              v-model="port"
              label="Port"
              data-id="port-input"
            ></v-text-field>
          </v-col>
          <v-col cols="6">
            <v-text-field
              v-model="number_workers"
              label="Number of Workers"
              type="number"
              data-id="worker-input"
            ></v-text-field>
          </v-col>
          <v-spacer />
          <v-btn text data-id="advanced-input-button"> </v-btn>
        </v-row>
      </v-card-text>
      <v-card-actions class="pt-0">
        <v-spacer></v-spacer>
        <v-btn
          color="primary"
          text
          @click="closeDialog()"
          data-id="cancel-add-database-button"
          >Cancel</v-btn
        >
        <v-btn
          color="primary"
          text
          @click="
            createNewDatabase();
            closeDialog();
          "
          :disabled="!!idError.length"
          data-id="save-database-button"
          >Save</v-btn
        >
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch,
} from "@vue/composition-api";
import { useDatabaseService } from "../../services/databaseService";

interface Props {
  open: boolean;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): DatabaseCreationData {
    return {
      ...useDatabaseCreation(context),
    };
  },
});

interface DatabaseCreationData {
  number_workers: Ref<number>;
  id: Ref<string>;
  user: Ref<string>;
  password: Ref<string>;
  host: Ref<string>;
  port: Ref<string>;
  dbname: Ref<string>;
  idError: Ref<string>;
  createNewDatabase: () => void;
  closeDialog: () => void;
}

function useDatabaseCreation(context: SetupContext): DatabaseCreationData {
  const { addDatabase } = useDatabaseService();

  const number_workers = ref<number>(8);
  const id = ref<string>("");
  const user = ref<string>("serviceuser");
  const password = ref<string>("");
  const host = ref<string>("vm-");
  const port = ref<string>("5432");
  const dbname = ref<string>("postgres");
  const idError = ref<string>("");

  watch(host, (host, prevHost) => {
    if (!id.value.length || id.value === prevHost) id.value = host;
  });

  watch(id, (id) => {
    if (
      context.root.$databaseController.availableDatabasesById.value.includes(id)
    ) {
      idError.value = "ID is already taken.";
    } else if (id.length === 0) {
      idError.value = "Choose an Id";
    } else {
      idError.value = "";
    }
  });

  function resetValues(): void {
    number_workers.value = 8;
    id.value = "";
    user.value = "serviceuser";
    password.value = "";
    host.value = "vm-";
    port.value = "5432";
    dbname.value = "postgres";
  }

  function createNewDatabase(): void {
    addDatabase({
      number_workers: parseInt(number_workers.value.toString(), 10),
      id: id.value,
      user: user.value,
      password: password.value,
      host: host.value,
      port: port.value,
      dbname: dbname.value,
    });
    resetValues();
  }

  function closeDialog(): void {
    context.emit("close");
  }

  return {
    number_workers,
    id,
    user,
    password,
    host,
    port,
    dbname,
    createNewDatabase,
    closeDialog,
    idError,
  };
}
</script>
