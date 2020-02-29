import { Database } from "@/types/database";
import { SetupContext, Ref, computed } from "@vue/composition-api";

export function useUpdatingDatabases(
  props: any,
  context: SetupContext
): { databases: Ref<readonly Database[]> } {
  console.log(props.selectedDatabases);
  return {
    databases: computed(() =>
      context.root.$databaseController.getDatabasesByIds(
        props.selectedDatabases
      )
    )
  };
}
