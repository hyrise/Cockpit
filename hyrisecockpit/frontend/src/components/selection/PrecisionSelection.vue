<template>
  <v-select
    id="precision-selection"
    v-model="selectedPrecision"
    :items="selectablePrecisions"
    label="Aggregation Interval"
    :disabled="disabled"
  />
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  computed,
  watch,
} from "@vue/composition-api";
import { useFormatting } from "@/meta/formatting";

interface Data {
  selectedPrecision: Ref<number>;
  selectablePrecisions: any;
}

interface Props {
  availablePrecisions: { text: string; value: number }[];
  disabled: boolean;
  global: boolean;
  maxPrecision: number;
}

export default defineComponent({
  props: {
    availablePrecisions: {
      type: Array,
      default: () => [],
    },
    disabled: {
      type: Boolean,
      default: false,
    },
    global: {
      type: Boolean,
      default: true,
    },
    maxPrecision: {
      type: Number,
      default: null,
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const localPrecision = ref(0);

    const selectablePrecisions = computed(() =>
      props.availablePrecisions.filter(
        (precision) =>
          precision.value <
            (props.global
              ? context.root.$selectionController.selectedRange.value
              : props.maxPrecision) &&
          precision.value >=
            (props.global
              ? context.root.$selectionController.selectedRange.value / 60
              : 0)
      )
    );

    /* reset selected precision to the first matching value, when range changes */
    watch(selectablePrecisions, () => {
      if (
        !selectablePrecisions.value
          .map((elem) => elem.value)
          .includes(
            props.global
              ? context.root.$selectionController.selectedPrecision.value
              : localPrecision.value
          )
      ) {
        if (props.global) {
          context.root.$selectionController.selectedPrecision.value =
            selectablePrecisions.value[0].value;
        } else {
          localPrecision.value = selectablePrecisions.value[0].value;
        }
      }
    });

    watch(localPrecision, () => {
      context.emit("precisionChanged", localPrecision.value);
    });

    return {
      selectablePrecisions,
      selectedPrecision: props.global
        ? context.root.$selectionController.selectedPrecision
        : localPrecision,
    };
  },
});
</script>
