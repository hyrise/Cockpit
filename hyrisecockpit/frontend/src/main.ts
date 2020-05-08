import Vue from "vue";
import VueCompositionApi from "@vue/composition-api";
import vuetify from "./plugins/vuetify";
import vueRouter from "./plugins/vueRouter";
import App from "./App.vue";
import { useDatabaseController } from "@/controller/databaseController";
import { useMetricController } from "@/controller/metricController";
import { useSelectionController } from "@/controller/selectionController";
import { usePluginController } from "@/controller/pluginController";

Vue.use(VueCompositionApi);

Vue.config.productionTip = false;

Vue.prototype.$databaseController = useDatabaseController();
Vue.prototype.$selectionController = useSelectionController();
Vue.prototype.$metricController = useMetricController();
Vue.prototype.$pluginController = usePluginController();

new Vue({
  vuetify,
  router: vueRouter,
  render: (h) => h(App),
}).$mount("#app");
