<template>
  <div id="details">
    <database-panel-template v-if="!fixedContent">
      <template #header>
        <div class="white--text">
          Databases
        </div>
      </template>
      <template #content>
        <database-system-details :selected-databases="selectedDatabases" />
      </template>
    </database-panel-template>
    <database-panel-template
      v-if="fixedContent"
      :accordion="true"
      header-color="white"
      :content-list="selectedDatabases"
      :show-panels="showDatabasePanels"
    >
      <template #optionalHeader>
        <v-card
          color="grey darken-3"
          width="100%"
          @click="toggleDatabasePanels()"
        >
          <v-card-title class="white--text">
            Databases
            <v-spacer />
            <v-icon left v-if="!showDatabasePanels" color="white"
              >mdi-plus</v-icon
            >
            <v-icon left v-if="showDatabasePanels" color="white"
              >mdi-minus</v-icon
            >
          </v-card-title>
        </v-card>
      </template>
    </database-panel-template>
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
import DatabaseSystemDetails from "./DatabaseSystemDetails.vue";
import DatabasePanelTemplate from "./DatabasePanelTemplate.vue";
import { useUpdatingDatabases } from "../../meta/databases";

interface Props {
  selectedDatabases: string[];
  handleScroll: boolean;
}
interface Data extends PanelTogglingData, ScrollHandlingData {
  databases: Ref<readonly Database[]>;
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
  components: { DatabaseSystemDetails, DatabasePanelTemplate },
  setup(props: Props, context: SetupContext): Data {
    return {
      ...useScrollHandling(props),
      ...useUpdatingDatabases(props, context),
      ...usePanelToggling()
    };
  }
});

interface PanelTogglingData {
  toggleDatabasePanels: () => void;
  showDatabasePanels: Ref<boolean>;
}

function usePanelToggling(): PanelTogglingData {
  const showDatabasePanels = ref(true);
  function toggleDatabasePanels(): void {
    showDatabasePanels.value = !showDatabasePanels.value;
  }
  return { toggleDatabasePanels, showDatabasePanels };
}

interface ScrollHandlingData {
  fixedContent: Ref<boolean>;
}

function useScrollHandling(props: Props): ScrollHandlingData {
  const fixedContent = ref(false);
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
      if (!fixedContent.value) {
        fixedContent.value = true;
      }
    } else {
      details.classList.remove("sticky");
      if (fixedContent.value) {
        fixedContent.value = false;
      }
    }
  }
  return { fixedContent };
}
</script>
<style>
.sticky {
  position: fixed;
  top: 70px;
  z-index: 10;
  width: 500px;
  right: 0px;
}
</style>
