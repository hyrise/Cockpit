<template>
  <v-dialog v-model="open" persistent max-width="600px">
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
      <v-card-text>
        <v-container>
          <v-alert v-if="databaseAdded === true" type="success" dismissible>
            Database was successfully added.
          </v-alert>
          <v-alert v-if="databaseAdded === false" type="error" dismissible>
            Database was not added.
          </v-alert>
          <v-row>
            <v-col cols="6">
              <v-text-field
                v-model="host"
                label="Host*"
                required
                data-id="host-input"
              ></v-text-field>
            </v-col>
            <v-col cols="6">
              <v-text-field
                v-model="id"
                label="Id*"
                required
                :error-messages="idError"
                data-id="id-input"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row align="center">
            <v-col cols="12" sm="6">
              <v-text-field
                v-model="number_workers"
                label="Number of Workers*"
                type="number"
                required
                data-id="worker-input"
              ></v-text-field>
            </v-col>
            <v-spacer />
            <v-btn
              text
              @click="showAdvanced = !showAdvanced"
              data-id="advanced-input-button"
            >
              <div v-if="!showAdvanced">show advanced</div>
              <div v-else>hide advanced</div>
            </v-btn>
          </v-row>
          <v-expand-transition>
            <div v-if="showAdvanced">
              <v-row>
                <v-col cols="6" sm="6">
                  <v-text-field
                    v-model="port"
                    label="Port*"
                    required
                    data-id="port-input"
                  ></v-text-field>
                </v-col>
                <v-col cols="6" sm="6">
                  <v-text-field
                    v-model="dbname"
                    label="Databasename*"
                    required
                    data-id="dbname-input"
                  ></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="6">
                  <v-text-field
                    v-model="user"
                    label="User*"
                    required
                    data-id="user-input"
                  ></v-text-field>
                </v-col>
                <v-col cols="6">
                  <v-text-field
                    v-model="password"
                    label="Password"
                    type="password"
                    data-id="password-input"
                  ></v-text-field>
                </v-col>
              </v-row>
            </div>
          </v-expand-transition>
        </v-container>
        <small>*indicates required field</small>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
          color="primary"
          text
          @click="
            databaseAdded = null;
            createNewDatabase();
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
import { useDatabaseService } from "@/services/databaseService";

interface Props {
  open: boolean;
}
interface Data extends DatabaseCreationData {
  showAdvanced: Ref<boolean>;
}

export default defineComponent({
  props: {
    open: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const showAdvanced = ref(false);
    return {
      ...useDatabaseCreation(context),
      showAdvanced,
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
