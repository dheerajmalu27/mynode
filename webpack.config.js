const path = require('path');

module.exports = {
  entry: './app.js', // your entry point
  output: {
    filename: 'bundle.js', // output bundle file
    path: path.resolve(__dirname, 'dist'), // output directory
  },
  resolve: {
    fallback: {
      util: require.resolve('util/'),
      path: require.resolve('path-browserify'),
    },
  },
  // Add other Webpack configurations as needed
};
