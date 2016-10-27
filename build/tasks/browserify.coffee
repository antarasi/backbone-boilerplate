module.exports = ->
  @loadNpmTasks 'grunt-browserify'

  # This task uses the Browserify optimizer
  @config 'browserify',
    options:
      transform: [
        'coffeeify'
#        'babelify'
      ]
      watch: true

    development:
      options:
        browserifyOptions:
          debug: true

      src: 'app/main.js'
      dest: 'dist/bundle.js'

    production:
      options:
        configure: (bundler) ->
          bundler.transform(global: true, 'uglifyify')

      src: 'app/main.js'
      dest: 'dist/bundle.js'

    testing:
      src: 'test/runner.js'
      dest: 'dist/test-runner.js'
