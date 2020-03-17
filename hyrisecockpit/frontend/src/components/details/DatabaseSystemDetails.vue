<template>
  <div class="flex">
    <v-card
      class="card"
      :style="databaseFlex"
      v-for="database in databases"
      :key="database.id"
    >
      <v-container color="secondary" fluid>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-database</v-icon>
            <b>ID: </b>
          </v-col>
          <v-col class="entry">
            <v-avatar class="mr-2" size="16" :color="database.color" />
            <b>{{ database.id }}</b>
          </v-col>
        </v-row>
        <v-divider class="divider" />
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-desktop-classic</v-icon>
            <b>Host:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.host }}
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-memory</v-icon>
            <b>Memory capacity:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.memoryCapacity }} GB
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-shoe-print</v-icon>
            <b>Memory footprint:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.memoryFootprint }} MB
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-cpu-64-bit</v-icon>
            <b>Number of CPUs:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.numberOfCPUs }}
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-account-hard-hat </v-icon>
            <b>Number of workers:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.numberOfWorkers }}
          </v-col>
        </v-row>
      </v-container>
    </v-card>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import { Database } from "../../types/database";
import { useUpdatingDatabases } from "../../meta/databases";
import { useDatabaseFlex } from "../../meta/components";

interface Props {
  selectedDatabases: string[];
}
interface Data {
  databases: Ref<readonly Database[]>;
  databaseFlex: Readonly<Ref<Object>>;
}

export default defineComponent({
  name: "DatabaseSystemDetails",
  props: {
    selectedDatabases: {
      type: Array,
      default: null
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      ...useUpdatingDatabases(props, context),
      ...useDatabaseFlex(props)
    };
  }
});
</script>
<style>
.flex {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.entry {
  margin-top: 0.5%;
  margin-left: 2%;
}
.card {
  margin-bottom: 0.5%;
  margin-top: 1%;
  margin-right: 0.5%;
}
.divider {
  margin-top: 1%;
  margin-bottom: 1%;
}
</style>
