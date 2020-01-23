import Vue from "vue";
import VueRouter from "vue-router";
import DatabaseInstance from "../screens/DatabaseInstance.vue";
import DatabasesComparison from "../screens/DatabasesComparison.vue";
import DatabasesScreen from "../screens/DatabasesScreen.vue";
import Home from "../screens/Home.vue";
import WorkloadScreen from "../screens/WorkloadScreen.vue";

Vue.use(VueRouter);

const routes = [
  { name: "home", path: "/", component: Home },
  { name: "database", path: "/database/:id", component: DatabaseInstance },
  { name: "workload", path: "/workload", component: WorkloadScreen },
  { name: "databases", path: "/databases", component: DatabasesScreen },
  {
    name: "comparison",
    path: "/databases/compare",
    component: DatabasesComparison
  }
];

export default new VueRouter({
  routes
});
