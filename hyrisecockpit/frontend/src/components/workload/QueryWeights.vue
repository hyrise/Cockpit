<template>
  <v-expansion-panels v-model="panels" multiple>
    <v-expansion-panel
      v-for="workload in selectedWorkloads"
      :key="workload"
      data-id="workload-equalizer"
    >
      <v-expansion-panel-header color="grey lighten-1">
        {{ workload }}
      </v-expansion-panel-header>
      <v-expansion-panel-content class="mt-4">
        <v-row class="query-weights">
          <div
            v-for="(weight, idx) in weights[workload]"
            :key="weight.name"
            class="query-weights-row"
          >
            <div v-if="idx % queriesPerRow === 0">
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
            <div v-if="isEndOfLine(workload, idx)">
              <div class="text-col">
                <div class="query-numbers-text font-weight-medium">
                  Query ID
                </div>
                <div class="query-weights-text font-weight-medium">
                  Query weight
                </div>
              </div>
            </div>
          </div>
        </v-row>
        <div class="text-center">
          <v-tooltip right>
            <template v-slot:activator="{ on }">
              <v-btn
                v-on="on"
                class="secondary primary--text"
                @click="resetWeights(workload)"
              >
                Reset
              </v-btn>
            </template>
            <span>Sets all weights to 1</span>
          </v-tooltip>
        </div>
      </v-expansion-panel-content>
    </v-expansion-panel>
  </v-expansion-panels>
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

interface Props {
  selectedWorkloads: string[];
  initialWeights: Record<string, number>[];
}

interface Data {
  weights: Ref<Record<string, Weight[]>>;
  panels: Ref<number[]>;
  queriesPerRow: Ref<number>;
  queriesPerWorkload: Ref<number[]>;
  updateWeight: (
    workload: string,
    name: string,
    sliderValueToValue: boolean
  ) => void;
  resetWeights: (workload: string) => void;
  isEndOfLine: (workload: string, index: number) => boolean;
}
type Weight = { name: string; value: number; sliderValue: number };

export default defineComponent({
  name: "QueryWeights",
  props: {
    selectedWorkloads: {
      type: Array,
      default: () => [],
    },
    initialWeights: {
      type: Array,
      default: () => [],
    },
  },
  setup(props: Props, context: SetupContext): Data {
    const weights = ref<Record<string, Weight[]>>({});
    const panels = ref<number[]>([]);
    const queriesPerRow = ref<number>(11);
    const queriesPerWorkload = ref<number[]>([]);

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
      const weight: Weight = Object.values(weights.value[workload]).find(
        (weight) => weight.name === name
      )!;
      if (sliderValueToValue) {
        weight.value = convertSliderValueToValue(weight.sliderValue);
      } else {
        weight.sliderValue = convertValueToSliderValue(weight.value);
      }
      context.emit("change", workload, name, weight.value);
    }
    function resetWeights(workload: string): void {
      Object.values(weights.value[workload]).forEach((weight) => {
        if (weight.value !== 1) {
          // set weights to the initial value of 1
          weight.value = 1;
          // set current slider values to the middle of the slider (50/100)
          weight.sliderValue = 50;
          context.emit("change", workload, weight.name, weight.value);
        }
      });
    }
    function isEndOfLine(workload: string, index: number): boolean {
      return (
        index % queriesPerRow.value === queriesPerRow.value - 1 ||
        index ===
          queriesPerWorkload.value[props.selectedWorkloads.indexOf(workload)] -
            1
      );
    }
    watch(
      () => props.initialWeights,
      () => {
        weights.value = {};
        Object.entries(props.initialWeights).forEach(
          ([workloadIndex, changedWeights]: [
            string,
            Record<string, number>
          ]) => {
            weights.value[
              props.selectedWorkloads[parseInt(workloadIndex)]
            ] = Object.entries(changedWeights)
              .sort()
              .map(([name, value]) => {
                return {
                  name: name,
                  value: value,
                  sliderValue: convertValueToSliderValue(value),
                };
              });
            queriesPerWorkload.value[parseInt(workloadIndex)] = Object.entries(
              changedWeights
            ).length;
          }
        );
      },
      { immediate: true }
    );
    watch(
      () => props.selectedWorkloads,
      () => {
        panels.value = Object.keys(props.selectedWorkloads).map((index) =>
          parseInt(index)
        );
      },
      { immediate: true }
    );
    return {
      weights,
      panels,
      queriesPerRow,
      queriesPerWorkload,
      updateWeight,
      resetWeights,
      isEndOfLine,
    };
  },
});
</script>
<style scoped>
.v-expansion-panel--active > .v-expansion-panel-header {
  min-height: 48px;
}
.v-expansion-panel-header {
  border-radius: 4px 4px 0px 0px !important;
}
.query-div {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.query-slider {
  padding: 0px 24px 0px 24px;
  margin-top: -25px;
}
.top-line {
  border-top: 2px solid #dfdfdf;
  width: 100%;
  margin-bottom: 12px;
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
  margin-bottom: 30px;
}
.value-col {
  display: flex;
  flex-direction: column;
  margin-right: 8px;
  margin-left: 8px;
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
}
.break {
  flex-basis: 100%;
  height: 0;
}
.query-weights-row {
  display: flex;
  margin-right: 10px;
}
.text-col {
  margin-left: 2px;
}
.query-weights-text {
  margin-top: 161px;
}
</style>
