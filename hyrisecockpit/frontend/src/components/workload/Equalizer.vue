<template>
  <span>
    <div v-for="(value, workload) in workloadData" :key="workload">
      <p v-if="value.selected" class="subtitle-1 font-weight-medium">
        {{ getDisplayedWorkload(workload) }}
      </p>
      <v-row class="equalizer">
        <div
          v-for="(weight, idx) in weights[workload]"
          :key="weight.name"
          class="equalizer-row"
        >
          <div v-if="idx % 15 === 0">
            <div class="value-col">
              <div class="max-value">
                100
              </div>
              <div class="medium-value">
                1
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
              @click="updateWeight(workload, weight.name, true)"
              @end="updateWeight(workload, weight.name, true)"
            />
            <div class="middle-line"></div>
            <div class="bottom-line"></div>
            <v-text-field
              v-model.number="weight.value"
              class="query-text-field"
              dense
              single-line
              @change="updateWeight(workload, weight.name, false)"
            />
          </div>
        </div>
      </v-row>
    </div>
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
  workloadData: Record<
    string,
    {
      loaded: boolean;
      loading: boolean;
      selected: boolean;
      weights: Record<string, number>;
    }
  >;
}

interface Data {
  weights: Record<string, Weight[]>;
  getDisplayedWorkload: (workload: Workload) => void;
  updateWeight: (
    workload: string,
    name: string,
    sliderValueToValue: boolean
  ) => void;
}
type Weight = { name: string; value: number; sliderValue: number };

export default defineComponent({
  name: "Equalizer",
  props: {
    workloadData: {
      type: Object,
      default: {},
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const weights: Record<string, Weight[]> = reactive({});

    /* convert the linear sliderValues with exponential function: f(sliderValue) = value = a * b^sliderValue - a
    f(0) = 0, f(50) = 1.0, f(100) = 100 --> b = 99^(1/50), a = 1/98 */
    const a = 1 / 98;
    const b = Math.pow(99, 1 / 50);

    function convertSliderValueToValue(sliderValue: number): number {
      return Math.round((a * Math.pow(b, sliderValue) - a) * 100) / 100;
    }
    function convertValueToSliderValue(value: number): number {
      return Math.round((Math.log((value + a) / a) / Math.log(b)) * 100) / 100;
    }
    function updateWeight(
      workload: string,
      name: string,
      sliderValueToValue: boolean
    ): void {
      //TODO: update value and sliderValue
      const weight: Weight = Object.values(weights[workload]).find(
        (weight) => weight.name === name
      )!;
      if (sliderValueToValue) {
        weight.value = convertSliderValueToValue(weight.sliderValue);
      } else {
        weight.sliderValue = convertValueToSliderValue(weight.value);
      }
      context.emit("change", workload, name, weight.value);
    }
    watch(
      () => props.workloadData,
      () => {
        Object.entries(props.workloadData).forEach((workload) => {
          weights[workload[0]] = Object.entries(workload[1].weights)
            .sort()
            .map(([name, value]) => {
              return {
                name: name,
                value: value,
                sliderValue: convertValueToSliderValue(value),
              };
            });
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
.middle-line {
  border-top: 2px solid #dfdfdf;
  width: 100%;
  margin-top: -88px;
}
.bottom-line {
  border-top: 2px solid #dfdfdf;
  width: 100%;
  margin-top: 73px;
  margin-bottom: 50%;
}
.value-col {
  display: flex;
  flex-direction: column;
  margin-right: 8px;
}
.min-value {
  margin-top: 53px;
  text-align: right;
}
.medium-value {
  margin-top: 53px;
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
