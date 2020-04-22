const vm = "aurora";
const port = "8000";
const backendUrl = `http://vm-${vm}.eaalab.hpi.uni-potsdam.de:${port}/`;
//const backendUrl = "http://127.0.0.1:3000/";

export const monitorBackend = backendUrl + "monitor/";
export const controlBackend = backendUrl + "control/";

export const isInTestMode: boolean =
  (window as any).Cypress || backendUrl.includes("127.0.0.1");
