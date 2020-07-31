export function getWorkloadName(
  workloadType: string,
  scaleFactor: string
): string {
  return `${getWorkloadTypeOfWorkloadName(workloadType)} SF ${scaleFactor}`;
}
export function getWorkloadTypeOfWorkloadName(workloadType: string): string {
  return `${workloadType.toUpperCase()}`;
}
export function getWorkloadType(workloadName: string): string {
  return workloadName.split(" ")[0].toLowerCase();
}
export function getScaleFactor(workloadName: string): string {
  return workloadName.split(" ")[2];
}
