<template>
  <span>
    <warning v-if="noDatabase">
      <template #message>
        No database added
      </template>
    </warning>
    <warning v-for="database in inactiveDatabases" :key="database">
      <template #message> {{ database }} is not active </template>
    </warning>
    <v-row>
      <v-chip
        class="mx-4 mt-4 mb-1 py-2 white--text"
        v-for="database in blockedDatabases"
        :key="database"
        :color="useDatabaseService().getDatabaseColor(database)"
      >
        <v-icon> mdi-exclamation </v-icon>
        <span> {{ database }} is blocked </span>
      </v-chip>
    </v-row>
  </span>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref,
  ref,
} from "@vue/composition-api";
import Warning from "./Warning.vue";
import { useDatabaseService } from "../../services/databaseService";

interface Data {
  noDatabase: Ref<boolean>;
  blockedDatabases: Ref<readonly string[]>;
  inactiveDatabases: Ref<readonly string[]>;
  useDatabaseService: () => void;
}

export default defineComponent({
  name: "StatusWarning",
  components: {
    Warning,
  },
  setup(props: {}, context: SetupContext): Data {
    const noDatabase = ref<boolean>(false);
    const blockedDatabases = ref<string[]>([]);
    const inactiveDatabases = ref<string[]>([]);
    return {
      noDatabase: computed(
        () =>
          context.root.$databaseController.getDatabaseStatusInformation()
            .noDatabase
      ),
      blockedDatabases: computed(
        () =>
          context.root.$databaseController.getDatabaseStatusInformation()
            .blockedDatabases
      ),
      inactiveDatabases: computed(
        () =>
          context.root.$databaseController.getDatabaseStatusInformation()
            .inactiveDatabases
      ),
      useDatabaseService,
    };
  },
});
</script>
