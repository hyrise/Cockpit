import Vue from "vue";
import VueCompositionApi from "@vue/composition-api";
import vuetify from "./plugins/vuetify";
import vueRouter from "./plugins/vueRouter";
import App from "./App.vue";
import { useDatabaseService } from "./services/databaseService";
import { useMetricController } from "./metricController";

Vue.use(VueCompositionApi);

Vue.config.productionTip = false;

Vue.prototype.$databaseService = useDatabaseService();
Vue.prototype.$metricController = useMetricController();

new Vue({
  vuetify,
  router: vueRouter,
  render: h => h(App)
}).$mount("#app");
