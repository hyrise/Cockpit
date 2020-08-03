const devServerUrl = "http://127.0.0.1:3000/";

//const backendUrl = devServerUrl;
const backendUrl = (window as any).Cypress?.env("stubless")
  ? devServerUrl
  : `http://${process.env.VUE_APP_BACKEND_HOST || "localhost"}:${
      process.env.VUE_APP_BACKEND_PORT || "8000"
    }/`;

export const monitorBackend = backendUrl + "monitor/";
export const metricBackend = backendUrl + "metric/";
export const controlBackend = backendUrl + "control/";
export const workloadBackend = backendUrl + "workload/";
export const statusBackend = backendUrl + "status/";

export const isInTestMode: boolean =
  (window as any).Cypress || backendUrl.includes(devServerUrl);
