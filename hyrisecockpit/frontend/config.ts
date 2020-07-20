//const backendUrl = "http://127.0.0.1:3000/";
const backendUrl = (window as any).Cypress?.env("stubless")
  ? "http://127.0.0.1:3000/"
  : `http://${process.env.VUE_APP_BACKEND_HOST}:${process.env.VUE_APP_BACKEND_PORT}/`;

export const monitorBackend = backendUrl + "monitor/";
export const controlBackend = backendUrl + "control/";
export const workloadBackend = backendUrl + "workload/";
export const statusBackend = backendUrl + "status/";

export const isInTestMode: boolean =
  (window as any).Cypress || backendUrl.includes("127.0.0.1:3000");
