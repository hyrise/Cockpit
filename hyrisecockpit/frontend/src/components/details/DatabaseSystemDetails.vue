<template>
  <div class="flex">
    <div
      id="database-system-details"
      :style="databaseFlex"
      v-for="database in databases"
      :key="database.id"
    >
      <v-card class="card" :color="database.color">
        <v-row class="detailsRow">
          <v-col
            id="database-host"
            :lg="databases.length > 1 ? 4 : 3"
            xl="3"
            :class="{
              multirowCol: !$vuetify.breakpoint.xl && databases.length > 1,
            }"
          >
            <v-card-title class="font-weight-regular white--text noPadding">
              {{ database.systemDetails.host }}
            </v-card-title>
            <v-card-text class="font-weight-regular white--text noPadding"
              >Host</v-card-text
            >
          </v-col>
          <v-col
            id="database-memory-capacity"
            :lg="databases.length > 1 ? 4 : 2"
            xl="2"
            :class="{
              multirowCol: !$vuetify.breakpoint.xl && databases.length > 1,
            }"
          >
            <v-card-title class="font-weight-light white--text noPadding"
              >{{ database.systemDetails.memoryCapacity }} GB</v-card-title
            >
            <v-card-text class="font-weight-light white--text noPadding"
              >Memory Capacity</v-card-text
            >
          </v-col>
          <v-col
            id="database-number-cpus"
            :lg="databases.length > 1 ? 4 : 2"
            xl="2"
            :class="{
              multirowCol: !$vuetify.breakpoint.xl && databases.length > 1,
            }"
          >
            <v-card-title class="font-weight-light white--text noPadding">
              {{ database.systemDetails.numberOfCPUs }}
            </v-card-title>
            <v-card-text class="font-weight-light white--text noPadding"
              ># of CPUs</v-card-text
            >
          </v-col>
          <v-col xl="0" :lg="databases.length > 1 ? 4 : 0" />
          <v-col
            id="database-memory-footprint"
            :lg="databases.length > 1 ? 4 : 2"
            xl="2"
            :class="{
              multirowCol: !$vuetify.breakpoint.xl && databases.length > 1,
            }"
          >
            <v-card-title class="mr-6 font-weight-light white--text noPadding"
              >{{ database.systemDetails.memoryFootprint }} MB</v-card-title
            >
            <v-card-text class="mr-10 font-weight-light white--text noPadding"
              >Data Size</v-card-text
            >
          </v-col>
          <v-col
            id="database-number-workers"
            :lg="databases.length > 1 ? 4 : 2"
            xl="2"
            :class="{
              multirowCol: !$vuetify.breakpoint.xl && databases.length > 1,
            }"
          >
            <v-card-title class="font-weight-light white--text noPadding">
              {{ database.systemDetails.numberOfWorkers }}
            </v-card-title>
            <v-card-text class="font-weight-light white--text noPadding"
              ># of Workers</v-card-text
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
  padding-left: 24px;
}
#comparison-page .card {
  border-radius: 4px 4px 0px 0px;
}
#overview-page .card {
  border-radius: 4px;
}
.v-card__title {
  padding-bottom: 6px;
}
.noPadding {
  padding: 0px !important;
  word-break: normal !important;
}
.detailsRow {
  padding: 12px;
}
.multirowCol {
  margin-bottom: 8px;
  font-size: 1em !important;
}
</style>
