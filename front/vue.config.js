/* eslint-disable @typescript-eslint/no-var-requires */
/* eslint-disable no-unused-labels */
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin

module.exports = {
  configureWebpack: {
    plugins: [
      new BundleAnalyzerPlugin({
        analyzerMode: 'static',
      }),
    ],
  },
  chainWebpack: (config) => {
    config.plugins.delete('prefetch')
    config.plugins.delete('preload')
  },
}
