import Vue from "vue";
import VueRouter from "vue-router";
import DatabaseScreen from "../screens/DatabaseScreen.vue";
import Home from "../screens/Home.vue";
import WorkloadScreen from "../screens/WorkloadScreen.vue";

Vue.use(VueRouter);

const routes = [
  { name: "home", path: "/", component: Home },
  { name: "database", path: "/database", component: DatabaseScreen },
  { name: "workload", path: "/workload", component: WorkloadScreen }
];

export default new VueRouter({
  routes
});
