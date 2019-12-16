import Vue from 'vue';
import VueCompositionApi from '@vue/composition-api';
import vuetify from './plugins/vuetify';
import vueRouter from './plugins/vueRouter';
import App from './App.vue';
import { useDatabaseFetchService } from './services/databaseService';

Vue.use(VueCompositionApi);
const { databases } = useDatabaseFetchService();

Vue.config.productionTip = false;
Vue.prototype.$databases = databases;

new Vue({
  vuetify,
  router: vueRouter,
  render: h => h(App),
}).$mount('#app');
