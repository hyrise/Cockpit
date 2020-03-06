<template>
  <div class="mx-12">
    <div class="mt-6 mb-2">
      <b> active databases overview </b>
    </div>
    <v-divider class="mb-4"></v-divider>
    <v-list>
      <v-list-item
        v-for="database in databases"
        :key="database"
        @click="openDatabaseScreen(database)"
      >
        <v-list-item-title>{{ database }}</v-list-item-title>
      </v-list-item>
    </v-list>

    <v-row justify="end">
      <v-dialog v-model="showDatabaseDialog" persistent max-width="600px">
        <template v-slot:activator="{ on }">
          <v-btn class="primary white--text my-8" v-on="on"
            >add new database</v-btn
          >
        </template>
        <v-card>
          <v-card-title>
            <span class="headline">Add new database</span>
          </v-card-title>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col cols="12">
                  <v-text-field
                    v-model="host"
                    label="Host*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="port"
                    label="Port*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="dbname"
                    label="Databasename*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    v-model="user"
                    label="User*"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12">
                  <v-text-field
                    v-model="password"
                    label="Password*"
                    type="password"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="number_workers"
                    label="Number of Workers*"
                    type="number"
                    required
                  ></v-text-field>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-text-field
                    v-model="id"
                    label="Id*"
                    required
                  ></v-text-field>
                </v-col>
              </v-row>
            </v-container>
            <small>*indicates required field</small>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="primary" text @click="showDatabaseDialog = false"
              >Close</v-btn
            >
            <v-btn
              color="primary"
              text
              @click="
                createNewDatabase();
                showDatabaseDialog = false;
              "
              >Save</v-btn
            >
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-row>
  </div>
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
import axios from "axios";
import { Database } from "../types/database";
import { useMetricEvents } from "../meta/events";
import { useDatabaseService } from "../services/databaseService";

interface Props {}
interface Data extends DatabaseCreationData {
  databases: Ref<readonly string[]>;
}

export default defineComponent({
  setup(props: Props, context: SetupContext): Data {
    const { emitWatchedMetricsChangedEvent } = useMetricEvents();

    onMounted(() => {
      emitWatchedMetricsChangedEvent();
    });

    return {
      databases: context.root.$databaseController.availableDatabasesById,
      ...useDatabaseCreation(context)
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
  showDatabaseDialog: Ref<boolean>;
  openDatabaseScreen: (databaseId: string) => void;
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

  const showDatabaseDialog = ref(false);

  function openDatabaseScreen(databaseId: string): void {
    context.root.$router.push({
      name: "database",
      params: { id: databaseId }
    });
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
    showDatabaseDialog,
    openDatabaseScreen
  };
}
</script>
<style scoped></style>
