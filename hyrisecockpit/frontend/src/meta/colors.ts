type Colors =
  | "blue"
  | "orange"
  | "green"
  | "red"
  | "violet"
  | "darkblue"
  | "darkorange"
  | "darkgreen"
  | "darkred"
  | "darkviolet";
type Hex =
  | "#a6cee3"
  | "#fdbf6f"
  | "#b2df8a"
  | "#fb9a99"
  | "#cab2d6"
  | "#1f78b4"
  | "#ff7f00"
  | "#33a02c"
  | "#e31a1c"
  | "#6a3d9a";

export const colorDefinition: Record<Colors, Hex> = {
  blue: "#a6cee3",
  orange: "#fdbf6f",
  green: "#b2df8a",
  red: "#fb9a99",
  violet: "#cab2d6",
  darkblue: "#1f78b4",
  darkorange: "#ff7f00",
  darkgreen: "#33a02c",
  darkred: "#e31a1c",
  darkviolet: "#6a3d9a"
};

export const databaseColorDefinition: Record<string, any> = {
  "vm-york": colorDefinition.blue,
  "vm-citadelle": colorDefinition.orange,
  "vm-aurora": colorDefinition.green,
  "vm-momentum": colorDefinition.red
};
