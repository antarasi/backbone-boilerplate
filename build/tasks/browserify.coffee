module.exports = ->
  @loadNpmTasks 'grunt-browserify'

  # This task uses the Browserify optimizer
  @config 'browserify',
    options:
      transform: [
        'coffeeify'
        'brfs'
      ]
      watch: true

    development:
      options:
        browserifyOptions:
          extensions: ['.coffee']
          debug: true

      src: 'app/main.js'
      dest: 'dist/bundle.js'

    production:
      options:
        browserifyOptions:
          extensions: ['.coffee']
        configure: (bundler) ->
          bundler.transform(global: true, 'uglifyify')

      src: 'app/main.js'
      dest: 'dist/bundle.js'
