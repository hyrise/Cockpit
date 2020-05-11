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
              200
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
            v-model="weight.weight"
            :value="weight.weight"
            thumb-label
            thumb-size="24"
            min="0"
            max="200"
            vertical
            class="query-slider"
            @click="$emit('change', weight.name, weight.weight)"
          />
          <div class="bottom-line"></div>
          <v-text-field
            v-model="weight.weight"
            class="query-text-field"
            dense
            single-line
            @change="$emit('change', weight.name, weight.weight)"
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
  weights: Ref<{ name: string; weight: number }[]>;
  getDisplayedWorkload: (workload: Workload) => void;
}

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
    const weights = ref<{ name: string; weight: number }[]>([]);
    watch(
      () => props.initialWeights,
      () => {
        weights.value = [];
        Object.entries(props.initialWeights)
          .sort()
          .forEach(([name, weight]: any) => {
            weights.value.push({ name: name, weight: weight });
          });
      }
    );
    return {
      weights,
      getDisplayedWorkload,
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
  margin-bottom: -20px;
}
.bottom-line {
  border-top: 2px solid #dfdfdf;
  width: 100%;
  margin-top: -20px;
  margin-bottom: 50%;
}
.value-col {
  display: flex;
  flex-direction: column;
  margin-right: 8px;
}
.min-value {
  margin-top: 115px;
  text-align: right;
}
.max-value {
  margin-top: 20px;
  text-align: right;
}
.query-text-field >>> input {
  text-align: center;
}
.query-text-field {
  width: 40px;
  margin-top: -20px;
  text-align: center !important;
}
.equalizer {
  margin-left: 20px;
  margin-right: 20px;
}
.query-name {
  margin-bottom: -15px;
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
