const { environment } = require('@rails/webpacker')
const customConfig = require('./custom')

// Bootstrap 3 has a dependency over jQuery:
const webpack = require('webpack');
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
);

// Merge custom config
environment.config.merge(customConfig)

module.exports = environment
