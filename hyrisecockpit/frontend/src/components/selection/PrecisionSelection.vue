<template>
  <v-select
    id="precision-selection"
    v-model="selectedPrecision"
    :items="selectablePrecisions"
    label="Aggregation intervals"
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

export default defineComponent({
  setup(props: {}, context: SetupContext): Data {
    const { formatMinutesToSeconds } = useFormatting();

    const availablePrecisions = [
      { text: "1 second", value: 1 },
      { text: "5 seconds", value: 5 },
      { text: "15 seconds", value: 15 },
      { text: "30 seconds", value: 30 },
      { text: "1 minute", value: formatMinutesToSeconds(1) },
      { text: "5 minutes", value: formatMinutesToSeconds(5) },
    ];

    const selectablePrecisions = computed(() =>
      availablePrecisions.filter(
        (precision) =>
          precision.value <
            context.root.$selectionController.selectedRange.value &&
          precision.value >=
            context.root.$selectionController.selectedRange.value / 60
      )
    );

    /* reset selected precision to the first matching value, when range changes */
    watch(selectablePrecisions, () => {
      if (
        !selectablePrecisions.value
          .map((elem) => elem.value)
          .includes(context.root.$selectionController.selectedPrecision.value)
      ) {
        context.root.$selectionController.selectedPrecision.value =
          selectablePrecisions.value[0].value;
      }
    });

    return {
      selectablePrecisions,
      selectedPrecision: context.root.$selectionController.selectedPrecision,
    };
  },
});
</script>
