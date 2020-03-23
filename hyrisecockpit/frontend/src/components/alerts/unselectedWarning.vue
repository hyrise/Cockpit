<template>
  <v-alert
    v-if="show"
    class="alert mt-2 primary--text"
    type="warning"
    color="warning"
  >
    <slot name="message" />
  </v-alert>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  computed,
  Ref
} from "@vue/composition-api";

interface Data {
  show: Ref<boolean>;
}

interface Props {
  condition: any[];
}

export default defineComponent({
  name: "UnselectedWarning",
  props: {
    condition: {
      type: Array,
      default: () => []
    }
  },
  setup(props: Props, context: SetupContext): Data {
    return {
      show: computed(() => !props.condition.length)
    };
  }
});
</script>
<style scoped>
.alert {
  margin-top: 1%;
}
</style>
