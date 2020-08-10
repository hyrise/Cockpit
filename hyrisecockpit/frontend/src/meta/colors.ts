export const colorValueDefinition = {
  darkgrey: "#424242",
  lightgrey: "#bdbdbd",
  white: "ffffff",
  green: "#a6cf91",
  orange: "#ffcc5c",
  red: "#ff6f69",
  darkred: "#b24d49",
  blue: "#96ccce",
  darkblue: "#1f688a",
  background: "#F5F5F5",
  hyriselogo: "#02789D",
};

export const colorDatabaseDefinition = {
  darkblue: "#1c4e80",
  orange: "#ea6a47",
  green: "#6ab187",
  red: "#ac3e31",
  yellow: "#dbae58",
  turquoise: "#488a99",
  blue: "#32a7dd",
  grey: "#7e909a",
};

export const colorTreemapDefinition = {
  green: "#a6cf91",
  orange: "#ffcc5c",
  red: "#ff6f69",
  darkred: "#b24d49",
  blue: "#96ccce",
  darkblue: "#1f688a",
  pink: "#c895a2",
  skincolor: "#e2b2a0",
  darkviolet: "#bea0a5",
  greengrey: "#a5b7b0",
  mintgreen: "#87a18e",
  oceanblue: "#7baea2",
  pink2: "#fb87be",
  blue2: "#58a1a3",
  yellow: "#fec981",
};

export const multiColors = Object.entries({
  ...colorTreemapDefinition,
})
  .filter(([id, _]) =>
    ["grey", "white", "background"].every((key) => !id.includes(key))
  )
  .map(([_, value]) => value);
