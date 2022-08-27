const { defineConfig } = require('@vue/cli-service');

const BundleTracker = require('webpack-bundle-tracker');

const pages = {
  homepage: {
    entry: './src/homepage.js',
    chunks: ['chunk-vendors'],
  }
};

module.exports = {
    pages: pages,
    filenameHashing: false,
    productionSourceMap: false,
    publicPath: process.env.NODE_ENV === 'production'
        ? ''
        : 'http://localhost:8080/',
    outputDir: '../static/vue/',

    chainWebpack: config => {

        config.optimization
            .splitChunks({
                cacheGroups: {
                    vendor: {
                        test: /[\\/]node_modules[\\/]/,
                        name: "chunk-vendors",
                        chunks: "all",
                        priority: 1
                    },
                },
            });

        Object.keys(pages).forEach(page => {
            config.plugins.delete(`html-${page}`);
            config.plugins.delete(`preload-${page}`);
            config.plugins.delete(`prefetch-${page}`);
        })

        config
            .plugin('BundleTracker')
            .use(BundleTracker, [{filename: '../portfolio_vue/webpack-stats.json'}]);

        config.resolve.alias
            .set('__STATIC__', 'static')
// todo: remove dev server and port to secure connection
        config.devServer
            .host('localhost')
            .port(8080)
            .hot("only")
            .http2(true)
            .https(false)
            .headers({"Access-Control-Allow-Origin": ["*"]});
    }
};
