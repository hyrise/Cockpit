<template>
  <div>
    <database-selection @selectionChanged="handleDatabaseChange" />
    <database-selection @selectionChanged="handleDatabaseChange" />
    <database-selection @selectionChanged="handleDatabaseChange" />
    <div v-if="page === `WORKLOAD`">test</div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  watch,
  computed,
  reactive,
  Ref,
  ref,
  onMounted
} from "@vue/composition-api";

import { Database } from "@/types/database";
import DatabaseSelection from "@/components/selection/DatabaseSelection.vue";
import { useDatabaseEvents } from "@/meta/events";
import { getPageName, PageName } from "@/types/views";

interface Props {}

interface Data {
  page: Ref<PageName>;
  handleDatabaseChange: (databases: string[]) => void;
}

export default defineComponent({
  props: {},

  components: { DatabaseSelection },
  setup(props: Props, context: SetupContext): Data {
    const { emitSelectedDatabasesChangedWithinEvent } = useDatabaseEvents();
    const page = computed(() => {
      console.log(context.root.$route.name!);
      return getPageName(context.root.$route.name!);
    });

    function handleDatabaseChange(databases: string[]): void {
      console.log(page.value);
      emitSelectedDatabasesChangedWithinEvent(page.value, databases);
    }

    return { handleDatabaseChange, page };
  }
});
</script>
