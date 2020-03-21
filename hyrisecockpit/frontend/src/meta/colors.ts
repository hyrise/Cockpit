const colors: string[] = ["#a6cee3", "#fdbf6f", "#b2df8a", "#fb9a99", "#cab2d6", "#1f78b4", "#ff7f00", "#33a02c", "#e31a1c", "#6a3d9a"]

export function getColor(index: number): string {
  return colors[index];
}
export function getColors(): string[] {
    return colors;
}