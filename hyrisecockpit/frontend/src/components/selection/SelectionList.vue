<template>
  <div>
    <database-selection
      :initial-databases="selectedDatabases"
      @selectionChanged="handleDatabaseChange"
    />
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
import { PageName } from "@/types/views";

interface Props {}

interface Data {
  page: Ref<PageName>;
  selectedDatabases: Ref<readonly string[]>;
  handleDatabaseChange: (databaseId: string, value: boolean) => void;
}

export default defineComponent({
  props: {},

  components: { DatabaseSelection },
  setup(props: Props, context: SetupContext): Data {
    const { emitSelectedDatabasesChangedWithinEvent } = useDatabaseEvents();
    const page = computed(() => {
      return context.root.$route.name! as PageName;
    });
    const selectedDatabases = computed(() => {
      return context.root.$selectionController.selectedDatabases[
        page.value
      ] as string[];
    });

    function handleDatabaseChange(databaseId: string, value: boolean): void {
      emitSelectedDatabasesChangedWithinEvent(page.value, databaseId, value);
    }

    return { handleDatabaseChange, page, selectedDatabases };
  }
});
</script>
