const path = require("path");
const nodeExternals = require("webpack-node-externals");
module.exports = {
  target: "node",
  mode: "development", // or 'production' or 'none'
  entry: "./app.js", // your entry point
  output: {
    filename: "bundle.js", // output bundle file
    path: path.resolve(__dirname, "dist"), // output directory
  },
  externals: [nodeExternals()], // Exclude Node.js built-in modules
  resolve: {
    fallback: {
      http: require.resolve("stream-http"),
      fs: false,
      path: require.resolve("path-browserify"),
      url: require.resolve("url"),
    },
  },
  stats: {
    errorDetails: true,
  },
};
