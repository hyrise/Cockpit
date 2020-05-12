<template>
  <div class="flex">
    <div
      id="database-system-details"
      :style="databaseFlex"
      v-for="database in databases"
      :key="database.id"
    >
      <v-card class="card" :color="database.color" tile>
        <v-row>
          <v-col id="database-host" class="leftcol" cols="3">
            <v-card-title class="ml-6 font-weight-regular white--text">
              {{ database.systemDetails.host }}
            </v-card-title>
            <v-card-text class="ml-6 font-weight-regular white--text"
              >Host</v-card-text
            >
          </v-col>
          <v-col id="database-memory-capacity" cols="2">
            <v-card-title class="font-weight-light white--text"
              >{{ database.systemDetails.memoryCapacity }} GB</v-card-title
            >
            <v-card-text class="font-weight-light white--text"
              >Memory Capacity</v-card-text
            >
          </v-col>
          <v-col id="database-number-cpus" cols="2">
            <v-card-title class="font-weight-light white--text">
              {{ database.systemDetails.numberOfCPUs }}
            </v-card-title>
            <v-card-text class="font-weight-light white--text"
              >Number of CPUs</v-card-text
            >
          </v-col>
          <v-col id="database-number-workers" cols="2">
            <v-card-title class="font-weight-light white--text">
              {{ database.systemDetails.numberOfWorkers }}
            </v-card-title>
            <v-card-text class="font-weight-light white--text"
              >Number of Workers</v-card-text
            >
          </v-col>
          <v-col id="database-memory-footprint" class="mr-2" cols="2">
            <v-card-title class="mr-6 font-weight-light white--text"
              >{{ database.systemDetails.memoryFootprint }} MB</v-card-title
            >
            <v-card-text class="mr-10 font-weight-light white--text"
              >Data Size</v-card-text
            >
          </v-col>
        </v-row>
      </v-card>
    </div>
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
} from "@vue/composition-api";
import { Database } from "@/types/database";
import { useUpdatingDatabases } from "@/meta/databases";
import { useDatabaseFlex } from "@/meta/components";
import DatabaseChip from "@/components/details/DatabaseChip.vue";

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
      default: null,
    },
  },
  components: {
    DatabaseChip,
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      ...useUpdatingDatabases(props, context),
      ...useDatabaseFlex(props),
    };
  },
});
</script>
<style scoped>
.flex {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  margin-top: 6px;
  margin-bottom: 0px;
}
.col {
  padding: 0px;
}
.card {
  display: flex;
  flex-direction: column;
  margin-right: 6px;
  margin-left: 6px;
}
#comparison-page .card {
  border-radius: 4px 4px 0px 0px;
}
#overview-page .card {
  border-radius: 4px;
}
.leftcol {
  padding-right: 8px;
}
.v-card__title {
  padding-bottom: 6px;
}
</style>
