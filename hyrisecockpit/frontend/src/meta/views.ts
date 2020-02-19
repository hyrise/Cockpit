import { SetupContext, watch, Ref, ref } from "@vue/composition-api";

export function useDatabaseSelection(
  context: SetupContext
): { availableInstances: Ref<any[]>; watchedInstances: Ref<any[]> } {
  const watchedInstances = ref<any[]>([]);
  const availableInstances = ref<any[]>([]);

  const { isReady } = context.root.$databaseService;

  watch(isReady, () => {
    if (isReady.value) {
      availableInstances.value = context.root.$databaseService.databases.value.map(
        database => {
          return { text: database.id, value: database };
        }
      );
      watchedInstances.value = availableInstances.value;
    }
  });
  return { watchedInstances, availableInstances };
}
