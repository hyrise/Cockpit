export function getWorkloadName(
  workloadType: string,
  scaleFactor: string
): string {
  return `${workloadType.toUpperCase()} SF ${scaleFactor}`;
}
export function getWorkloadType(workloadName: string): string {
  return workloadName.split(" ")[0].toLowerCase();
}
export function getScaleFactor(workloadName: string): string {
  return workloadName.split(" ")[2];
}
