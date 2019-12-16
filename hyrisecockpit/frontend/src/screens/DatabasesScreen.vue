<template>
  <div class="mx-12">
    <div class="mt-6 mb-2">
      <b> active databases overview </b>
    </div>
    <v-divider class="mb-4"></v-divider>
    <v-list>
      <v-list-item
        v-for="(item, index) in databaseIds"
        :key="index"
        @click="openDatabaseScreen(item)"
      >
        <v-list-item-title>{{ item }}</v-list-item-title>
      </v-list-item>
    </v-list>
    <v-row justify="end">
      <v-dialog v-model="newDatabaseDialog" persistent max-width="600px">
        <template v-slot:activator="{ on }">
          <v-btn class="green white--text my-8" v-on="on"
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
                    v-model="n_threads"
                    label="Number of Workers*"
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
            <v-btn color="blue darken-1" text @click="newDatabaseDialog = false"
              >Close</v-btn
            >
            <v-btn
              color="blue darken-1"
              text
              @click="openDatabaseScreen('item')"
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
  createComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";
import { useDatabaseFetchService } from "../services/databaseService";

interface Props {}
interface Data {
  databaseIds: Ref<string[]>;
  openDatabaseScreen: (string) => void;
  newDatabaseDialog: boolean;
  n_threads: Ref<string>;
  id: Ref<string>;
  user: Ref<string>;
  password: Ref<string>;
  host: Ref<string>;
  port: Ref<string>;
  dbname: Ref<string>;
}

export default createComponent({
  setup(props: Props, context: SetupContext): Data {
    const { databaseIds } = useDatabaseFetchService(); // this has to be changed on merge

    const n_threads = ref<string>("");
    const id = ref<string>("");
    const user = ref<string>("");
    const password = ref<string>("");
    const host = ref<string>("");
    const port = ref<string>("");
    const dbname = ref<string>("");

    function openDatabaseScreen(databaseId: string): void {
      console.log(databaseId);
      console.log(n_threads, "n_threads");
    }

    return {
      n_threads,
      id,
      user,
      password,
      host,
      port,
      dbname,
      databaseIds: databaseIds,
      openDatabaseScreen: openDatabaseScreen,
      newDatabaseDialog: false
    };
  }
});
</script>
<style scoped></style>
