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
                v-model="host"
                label="Host*"
                required
              ></v-text-field>
            </v-col>
            <v-col cols="6">
              <v-text-field v-model="id" label="Id*" required></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" sm="6">
              <v-text-field
                v-model="number_workers"
                label="Number of Workers*"
                type="number"
                required
              ></v-text-field>
            </v-col>
          </v-row>
          <v-expand-transition>
            <div v-if="showAdvanced">
              <v-row>
                <v-col cols="6" sm="6">
                  <v-text-field
                    v-model="port"
                    label="Port*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="6" sm="6">
                  <v-text-field
                    v-model="dbname"
                    label="Databasename*"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
              <v-row>
                <v-col cols="6">
                  <v-text-field
                    v-model="user"
                    label="User*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="6">
                  <v-text-field
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
        <v-btn class="advanced-btn" text @click="showAdvanced = !showAdvanced">
          <div v-if="!showAdvanced">
            show advanced
          </div>
          <div v-else>
            hide advanced
          </div>
        </v-btn>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn
          color="primary"
          text
          @click="
            closeDialog();
            showAdvanced = false;
          "
          >Close</v-btn
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

  watch(host, host => {
    id.value = host;
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
    closeDialog
  };
}
</script>
<style scoped>
.advanced-btn {
  float: right;
}
</style>
