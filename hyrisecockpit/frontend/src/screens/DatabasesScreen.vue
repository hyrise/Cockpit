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
}

export default createComponent({
  setup(props: Props, context: SetupContext): Data {
    const { databaseIds } = useDatabaseFetchService(); // this has to be changed on merge

    function openDatabaseScreen(databaseId: string): void {
      console.log(databaseId);
    }

    return { databaseIds: databaseIds, openDatabaseScreen: openDatabaseScreen };
  }
});
</script>
<style scoped></style>
