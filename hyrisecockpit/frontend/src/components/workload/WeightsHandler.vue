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
      <div v-for="(weight, key) in weights" :key="key" class="query-div">
        {{ key }}
        <div class="top-line"></div>
        <v-slider
          v-model="weights[key]"
          :value="weight"
          thumb-label
          thumb-size="24"
          min="0"
          max="200"
          vertical
          class="query-slider"
          @click="$emit('change', weights)"
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
} from "@vue/composition-api";
import { Workload } from "../../types/workloads";
import { getDisplayedWorkload } from "../../meta/workloads";

interface Props {
  initialWeights: Object;
  workload: Workload;
}

interface Data {
  weights: Ref<Object>;
  getDisplayedWorkload: (workload: Workload) => void;
}

export default defineComponent({
  name: "WeightsHandler",
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
    const weights = ref<Object>({});
    watch(
      () => props.initialWeights,
      () => {
        weights.value = props.initialWeights;
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
