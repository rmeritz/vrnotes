const { environment } = require('@rails/webpacker')

for (loader of environment.loaders) {
  loader.value.use = loader.value.use.filter(
    function(e) { return e.loader != "postcss-loader" }
  )
}

module.exports = environment
