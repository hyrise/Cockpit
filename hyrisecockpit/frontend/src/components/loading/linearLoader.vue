<template>
  <v-progress-linear v-if="loading" indeterminate color="primary" height="7" />
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref,
  watch
} from "@vue/composition-api";

interface Data {
  loading: Ref<boolean>;
}

interface Props {
  conditions: Ref<boolean>[];
  evaluations: boolean[];
}

export default defineComponent({
  name: "LinearLoader",
  props: {
    conditions: {
      type: Array,
      default: () => []
    },
    evaluations: {
      type: Array,
      default: () => []
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      loading: computed(() =>
        props.conditions.reduce(
          (isLoading: boolean, condition: Ref<boolean>, idx: number) =>
            condition.value === props.evaluations[idx] || isLoading,
          false
        )
      )
    };
  }
});
</script>
<style scoped></style>
