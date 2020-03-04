const vm = "aurora";
const port = "8000";
const backendUrl = `http://vm-${vm}.eaalab.hpi.uni-potsdam.de:${port}/`;

export const monitorBackend = backendUrl + "monitor/";
export const controlBackend = backendUrl + "control/";
