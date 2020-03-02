<template>
  <div id="details">
    <v-expansion-panels
      v-model="showPanels"
      multiple
      class="panels white--text"
    >
      <v-expansion-panel>
        <v-expansion-panel-header class="title white--text" color="primary">
          Databases
          <template #actions>
            <v-icon color="white">$expand</v-icon>
          </template>
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          <database-system-details
            :selected-databases="selectedDatabases"
            :show-description="showDescription"
          />
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  SetupContext,
  onMounted,
  computed,
  Ref,
  ref
} from "@vue/composition-api";
import { Database } from "../../types/database";
import DatabaseSystemDetails from "../details/DatabaseSystemDetails.vue";

interface Props {
  selectedDatabases: string[];
  handleScroll: boolean;
}
interface Data {
  showDescription: Ref<boolean>;
  showPanels: Ref<number[]>;
}

export default defineComponent({
  name: "DatabaseDetailsPanel",
  props: {
    selectedDatabases: {
      type: Array,
      default: null
    },
    handleScroll: {
      type: Boolean,
      default: true
    }
  },
  components: { DatabaseSystemDetails },
  setup(props: Props, context: SetupContext): Data {
    const showDescription = ref(true);
    const showPanels = ref<number[]>([0]);
    let details: any = null;
    let detailsPageOffset = 0;

    onMounted(() => {
      details = document.getElementById("details");
      detailsPageOffset = details!.offsetTop;
      if (props.handleScroll)
        window.onscroll = function() {
          handleScrollEvent();
        };
    });

    function handleScrollEvent(): void {
      if (window.pageYOffset > detailsPageOffset) {
        details.classList.add("sticky");
        if (showDescription.value) showDescription.value = false;
      } else {
        details.classList.remove("sticky");
        if (!showDescription.value) showDescription.value = true;
      }
    }

    return {
      showDescription,
      showPanels
    };
  }
});
</script>
<style>
.panels {
  margin-top: 0.5%;
}
.card {
  margin: 1%, 0%, 1%, 0%;
}
.entry {
  margin-top: 0.5%;
}
.sticky {
  position: fixed;
  top: 70px;
  z-index: 10;
  width: 500px;
  right: 0px;
}
.flex {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
.flex-item {
  flex: 0 0 32.5%;
  margin: 0px 3px 6px 3px;
  padding: 0px;
}
</style>
