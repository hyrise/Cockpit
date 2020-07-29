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
            databaseAdded = null;
          "
          >mdi-close</v-icon
        >
      </v-system-bar>
      <v-card-text class="pb-0">
        <v-alert
          v-if="databaseAdded"
          class="mt-4 mb-0"
          type="success"
          dismissible
          dense
        >
          Database was successfully added.
        </v-alert>
        <v-alert
          v-if="databaseAdded === false"
          class="mt-4 mb-0"
          type="error"
          dismissible
          dense
        >
          Database was not added.
        </v-alert>
        <v-alert
          v-if="workersRunning"
          class="mt-4 mb-0"
          type="error"
          dismissible
          dense
        >
          <v-row>
            <v-col class="grow pr-0 py-0"
              >Stop workers before adding databases.</v-col
            >
            <v-col class="shrink mr-2 pl-0 py-0">
              <v-tooltip right>
                <template v-slot:activator="{ on }">
                  <v-btn
                    v-on="on"
                    class="secondary primary--text"
                    x-small
                    @click="stop()"
                  >
                    Stop
                  </v-btn>
                </template>
                <span>Stops workers</span>
              </v-tooltip>
            </v-col>
          </v-row>
        </v-alert>
        <v-row>
          <v-col class="pb-0" cols="6">
            <v-text-field
              v-model="host"
              label="Host"
              :error-messages="!host.length ? 'Required' : ''"
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
          class="secondary primary--text my-2"
          @click="
            databaseAdded = null;
            createNewDatabase();
          "
          :disabled="
            !!idError.length ||
            !host.length ||
            !id.length ||
            !port.length ||
            number_workers.length === 0 ||
            workersRunning
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
import { useDatabaseService } from "@/services/databaseService";
import { useWorkloadService } from "../../services/workloadService";

interface Props {
  open: boolean;
  workersRunning: boolean;
}

interface Data extends DatabaseCreationData {
  stop: () => void;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false,
    },
    workersRunning: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const { stopWorkers } = useWorkloadService();

    function stop(): void {
      context.emit("stop");
      stopWorkers();
    }
    return {
      ...useDatabaseCreation(context),
      stop,
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
  databaseAdded: Ref<boolean | null>;
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
  const databaseAdded = ref<boolean | null>(null);

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
    }).then(
      () => {
        databaseAdded.value = true;
      },
      () => {
        databaseAdded.value = false;
      }
    );
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
    databaseAdded,
  };
}
</script>
