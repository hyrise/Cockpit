<template>
  <div class="flex">
    <v-card
      class="card"
      :style="{
        flex: `1 0 ${100 / selectedDatabases.length - 1}%`
      }"
      v-for="database in databases"
      :key="database.id"
    >
      <v-card-title>
        <v-avatar class="mr-2" size="20" :color="database.color" />
        {{ database.id }}
      </v-card-title>
      <v-container class="grey lighten-5" fluid>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-desktop-classic</v-icon>
            <b v-if="showDescription">host:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.host }}
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-memory</v-icon>
            <b v-if="showDescription">main memory capacity:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.mainMemoryCapacity }} GB
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-shoe-print</v-icon>
            <b v-if="showDescription">memory footprint:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.memoryFootprint }} MB
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-cpu-64-bit</v-icon>
            <b v-if="showDescription">number of CPUs:</b>
          </v-col>
          <v-col class="entry">
            {{ database.systemDetails.numberOfCPUs }}
          </v-col>
        </v-row>
        <v-row no-gutters>
          <v-col class="entry">
            <v-icon left> mdi-worker</v-icon>
            <b v-if="showDescription">number of workers:</b>
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

interface Props {
  selectedDatabases: string[];
  showDescription: boolean;
}
interface Data {
  databases: Ref<readonly Database[]>;
}

export default defineComponent({
  name: "DatabaseSystemDetails",
  props: {
    selectedDatabases: {
      type: Array,
      default: null
    },
    showDescription: {
      type: Boolean,
      default: true
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      ...useUpdatingDatabases(props, context)
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
.last {
  margin-bottom: 2%;
}
</style>
