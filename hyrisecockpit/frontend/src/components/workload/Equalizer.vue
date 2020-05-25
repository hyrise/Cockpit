<template>
  <span>
    <p class="subtitle-1 font-weight-medium">
      {{ getDisplayedWorkload(workload) }}
    </p>
    <v-row class="equalizer">
      <div
        v-for="(weight, idx) in weights"
        :key="weight.name"
        class="equalizer-row"
      >
        <div v-if="idx % 15 === 0">
          <div class="value-col">
            <div class="max-value">
              10000
            </div>
            <div class="min-value">
              0
            </div>
          </div>
        </div>
        <div class="query-div">
          <div class="query-name">
            {{ weight.name }}
          </div>
          <div class="top-line"></div>
          <v-slider
            v-model="weight.sliderValue"
            min="0"
            max="100"
            vertical
            class="query-slider"
            @click="updateWeight(weight.name, true)"
            @end="updateWeight(weight.name, true)"
          />
          <div class="bottom-line"></div>
          <v-text-field
            v-model.number="weight.value"
            class="query-text-field"
            dense
            single-line
            @change="updateWeight(weight.name, false)"
          />
        </div>
      </div>
    </v-row>
  </span>
</template>
<script lang="ts">
import {
  defineComponent,
  SetupContext,
  Ref,
  ref,
  watch,
  reactive,
} from "@vue/composition-api";
import { Workload } from "../../types/workloads";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  initialWeights: Object;
  workload: Workload;
}

interface Data {
  weights: Ref<Weight[]>;
  getDisplayedWorkload: (workload: Workload) => void;
  updateWeight: (name: string, sliderValueToValue: boolean) => void;
}
type Weight = { name: string; value: number; sliderValue: number };

export default defineComponent({
  name: "Equalizer",
  props: {
    initialWeights: {
      type: Object,
      default: {},
    },
    workload: {
      type: String,
      default: "",
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const weights = ref<Weight[]>([]);
    const a = 50 / 49;
    const b = Math.pow(99, 1 / 50);

    function convertSliderValueToValue(sliderValue: number): number {
      return Math.round(a * Math.pow(b, sliderValue) - a);
    }
    function convertValueToSliderValue(value: number): number {
      return Math.round(Math.log((value + a) / a) / Math.log(b));
    }
    function updateWeight(name: string, sliderValueToValue: boolean): void {
      const weight: Weight = Object.values(weights.value).find(
        (weight) => weight.name === name
      )!;
      sliderValueToValue
        ? (weight.value = convertSliderValueToValue(weight.sliderValue))
        : (weight.sliderValue = convertValueToSliderValue(weight.value));
      context.emit("change", name, weight.value);
    }
    watch(
      () => props.initialWeights,
      () => {
        weights.value = Object.entries(props.initialWeights)
          .sort()
          .map(([name, value]) => {
            return {
              name: name,
              value: value,
              sliderValue: convertValueToSliderValue(value),
            };
          });
      }
    );
    return {
      weights,
      getDisplayedWorkload,
      updateWeight,
    };
  },
});
</script>
<style scoped>
.query-div {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.query-slider {
  padding: 0px 24px 0px 24px;
}

.top-line {
  border-top: 2px solid #dfdfdf;
  width: 100%;
  margin-top: 50%;
  margin-bottom: -13px;
}
.bottom-line {
  border-top: 2px solid #dfdfdf;
  width: 100%;
  margin-top: -13px;
  margin-bottom: 50%;
}
.value-col {
  display: flex;
  flex-direction: column;
  margin-right: 8px;
}
.min-value {
  margin-top: 128px;
  text-align: right;
}
.max-value {
  margin-top: 15px;
  text-align: right;
}
.query-text-field >>> input {
  text-align: center;
}
.query-text-field {
  width: 44px;
  margin: -22px 3px 0px 3px;
  text-align: center !important;
}
.equalizer {
  margin-left: 20px;
  margin-right: 20px;
}
.query-name {
  margin-bottom: -22px;
}
.break {
  flex-basis: 100%;
  height: 0;
}
.equalizer-row {
  display: flex;
  margin-bottom: 10px;
}
</style>
