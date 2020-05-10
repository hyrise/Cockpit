<template>
  <span>
    <p class="subtitle-1 font-weight-medium">
      {{ getDisplayedWorkload(workload) }}
    </p>
    <v-row>
      <div class="value-col">
        <div>
          200
        </div>
        <div>
          -200
        </div>
      </div>
      <div v-for="weight in weights" :key="weight.name" class="query-div">
        {{ weight.name }}
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
        <div class="line"></div>
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
  justify-content: space-around;
}
</style>
