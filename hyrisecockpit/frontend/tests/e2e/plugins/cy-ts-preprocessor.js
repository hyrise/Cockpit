// eslint-disable-next-line @typescript-eslint/no-var-requires
const webpack = require("@cypress/webpack-preprocessor");

const webpackOptions = {
  resolve: {
    extensions: [".mjs", ".ts", ".js"],
  },
  module: {
    rules: [
      {
        test: /\.ts$/,
        loader: "ts-loader",
        exclude: [/node_modules/],
        options: { transpileOnly: true },
      },
      {
        // fixes https://github.com/graphql/graphql-js/issues/1272
        test: /\.mjs$/,
        include: /node_modules/,
        type: "javascript/auto",
      },
    ],
  },
};

const options = {
  webpackOptions,
};

module.exports = webpack(options);
