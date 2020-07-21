<template>
  <v-dialog v-model="open" persistent max-width="500px">
    <v-card data-id="add-database">
      <v-system-bar :height="50" color="secondary">
        <v-card-title>
          <span class="subtitle-1">Add new database</span>
        </v-card-title>
        <v-spacer />
        <v-icon
          data-id="cancel-add-database-button"
          @click="
            closeDialog();
            showAdvanced = false;
          "
          >mdi-close</v-icon
        >
      </v-system-bar>
      <v-card-text class="pb-0">
        <v-row>
          <v-col class="pb-0" cols="6">
            <v-text-field
              v-model="host"
              label="Host"
              :error-messages="host.length < 4 ? 'Required' : ''"
              data-id="host-input"
            ></v-text-field>
          </v-col>
          <v-col class="pb-0" cols="6">
            <v-text-field
              v-model="id"
              label="ID"
              :error-messages="!id.length ? 'Required' : idError"
              data-id="id-input"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col class="py-0" cols="6">
            <v-text-field
              v-model="port"
              label="Port"
              :error-messages="!port.length ? 'Required' : ''"
              data-id="port-input"
            ></v-text-field>
          </v-col>
          <v-col class="py-0" cols="6">
            <v-text-field
              v-model="number_workers"
              label="Number of Workers"
              type="number"
              min="1"
              :error-messages="number_workers.length === 0 ? 'Required' : ''"
              data-id="worker-input"
            ></v-text-field>
          </v-col>
        </v-row>
      </v-card-text>
      <v-card-actions class="justify-center pt-0">
        <v-btn
          class="secondary primary--text mb-3"
          small
          @click="
            createNewDatabase();
            closeDialog();
          "
          :disabled="
            !!idError.length ||
            !host.length ||
            !id.length ||
            !port.length ||
            number_workers.length === 0
          "
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
