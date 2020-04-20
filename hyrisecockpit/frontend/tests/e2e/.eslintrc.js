module.exports = {
  plugins: ["cypress"],
  env: {
    mocha: true,
    "cypress/globals": true,
  },
  rules: {
    "@typescript-eslint/no-explicit-any": "off",
    "@typescript-eslint/no-non-null-assertion": "off",
  },
};
