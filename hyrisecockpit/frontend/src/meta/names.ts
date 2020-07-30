import { isInTestMode } from "../../config";

export function changeTableName(table: string): string {
  if (isInTestMode) return table;
  const words = table.split("_");
  if (words.length === 4) {
    return (
      words[0] +
      " (" +
      words[1].toUpperCase() +
      " SF " +
      words[2] +
      "." +
      words[3] +
      ")"
    );
  }
  return words[0] + " (" + words[1].toUpperCase() + " SF " + words[2] + ")";
}
