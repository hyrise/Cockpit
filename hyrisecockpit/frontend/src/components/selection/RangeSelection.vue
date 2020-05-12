<template>
  <v-select
    id="historic-range-selection"
    v-model="selectedHistoricRange"
    :items="availableHistoricRanges"
    label="Observed Time Range"
    :disabled="disabled"
  />
</template>

<script lang="ts">
import { defineComponent, SetupContext, Ref, ref } from "@vue/composition-api";
import { useFormatting } from "@/meta/formatting";

interface Data {
  selectedHistoricRange: Ref<number>;
  availableHistoricRanges: any;
}

interface Props {
  disabled: boolean;
}

export default defineComponent({
  props: {
    disabled: {
      type: Boolean,
      default: false,
    },
  },
  setup(props: {}, context: SetupContext): Data {
    const { formatMinutesToSeconds } = useFormatting();

    const availableHistoricRanges = [
      { text: "last 30 seconds", value: formatMinutesToSeconds(0.5) },
      { text: "last minute", value: formatMinutesToSeconds(1) },
      { text: "last 5 minutes", value: formatMinutesToSeconds(5) },
      { text: "last 10 minutes", value: formatMinutesToSeconds(10) },
      { text: "last 30 minutes", value: formatMinutesToSeconds(30) },
      { text: "last 60 minutes", value: formatMinutesToSeconds(60) },
    ];

    return {
      availableHistoricRanges,
      selectedHistoricRange: context.root.$selectionController.selectedRange,
    };
  },
});
</script>
