<template>
  <v-dialog v-model="open" persistent max-width="600px">
    <v-card id="add-database">
      <v-card-title>
        <span class="headline">Add new database</span>
      </v-card-title>
      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols="6">
              <v-text-field
                id="host-input"
                v-model="host"
                label="Host*"
                required
              ></v-text-field>
            </v-col>
            <v-col cols="6">
              <v-text-field
                id="id-input"
                v-model="id"
                label="Id*"
                required
                :error-messages="idError"
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row align="center">
            <v-col cols="12" sm="6">
              <v-text-field
                id="worker-input"
                v-model="number_workers"
                label="Number of Workers*"
                type="number"
                required
              ></v-text-field>
            </v-col>
            <v-spacer />
            <v-btn
              id="advanced-input-button"
              text
              @click="showAdvanced = !showAdvanced"
            >
              <div v-if="!showAdvanced">
                show advanced
              </div>
              <div v-else>
                hide advanced
              </div>
            </v-btn>
          </v-row>
          <v-expand-transition>
            <div v-if="showAdvanced">
              <v-row>
                <v-col cols="6" sm="6">
                  <v-text-field
                    id="port-input"
                    v-model="port"
                    label="Port*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="6" sm="6">
                  <v-text-field
                    id="dbname-input"
                    v-model="dbname"
                    label="Databasename*"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="6">
                  <v-text-field
                    id="user-input"
                    v-model="user"
                    label="User*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="6">
                  <v-text-field
                    id="password-input"
                    v-model="password"
                    label="Password"
                    type="password"
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
          id="cancel-add-database-button"
          color="primary"
          text
          @click="
            closeDialog();
            showAdvanced = false;
          "
          >Cancel</v-btn
        >
        <v-btn
          id="save-database-button"
          color="primary"
          text
          @click="
            createNewDatabase();
            showAdvanced = false;
            closeDialog();
          "
          :disabled="!!idError.length"
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
  watch
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
      default: false
    }
  },
  setup(props: Props, context: SetupContext): Data {
    const showAdvanced = ref(false);
    return {
      ...useDatabaseCreation(context),
      showAdvanced
    };
  }
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

  watch(id, id => {
    if (
      context.root.$databaseController.availableDatabasesById.value.includes(id)
    ) {
      idError.value = "ID is already taken.";
    } else if (id.length === 0) {
      idError.value = "Choose an ID";
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
      dbname: dbname.value
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
    idError
  };
}
</script>
<style scoped></style>
