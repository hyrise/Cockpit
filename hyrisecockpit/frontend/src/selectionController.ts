import Vue from "vue";
import { eventBus } from "@/plugins/eventBus";
import { PageName } from "@/types/views";
import { SelectionController } from "@/types/controller";
import { pages } from "@/meta/views";
import { reactive, watch } from "@vue/composition-api";

export function useSelectionController(): SelectionController {
  const selectedDatabases = reactive<Record<PageName, string[]>>({
    comparison: [] as string[],
    overview: [] as string[],
    workload: [] as string[]
  });

  watch(
    () => Vue.prototype.$databaseController.databasesUpdated.value,
    () => {
      const databases = Vue.prototype.$databaseController.availableDatabasesById
        .value as string[];
      selectedDatabases.comparison = databases;
      selectedDatabases.overview = databases;
      selectedDatabases.workload = databases;
    }
  );

  pages.forEach(page => {
    eventBus.$on(
      `SELECTED_DATABASES_CHANGED_ON_${page.toUpperCase()}`,
      (payload: { database: string; value: boolean }) => {
        if (payload.value) {
          selectedDatabases[page].push(payload.database);
        } else {
          selectedDatabases[page] = selectedDatabases[page].filter(
            current => current !== payload.database
          );
        }
      }
    );
  });

  return { selectedDatabases };
}
