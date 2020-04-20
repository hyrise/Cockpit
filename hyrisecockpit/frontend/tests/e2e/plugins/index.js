// https://docs.cypress.io/guides/guides/plugins-guide.html

// if you need a custom webpack configuration you can uncomment the following import
// and then use the `file:preprocessor` event
// as explained in the cypress docs
// https://docs.cypress.io/api/plugins/preprocessors-api.html#Examples

// eslint-disable-next-line @typescript-eslint/no-var-requires
const cypressTypeScriptPreprocessor = require("./cy-ts-preprocessor");

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
module.exports = (on) => {
  on("file:preprocessor", cypressTypeScriptPreprocessor);
};
