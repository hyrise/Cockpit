const routes: Record<string, string> = {
  home: "/",
  overview: "databases/overview",
  comparison: "databases/compare",
  workloadMonitoring: "workload"
};

export function getRoute(component: string): string {
  return routes[component];
}
