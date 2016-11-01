module.exports = ->
  @loadNpmTasks 'grunt-karma'

  # Unit testing is provided by Karma.
  @config 'karma',
    options:
      basePath: process.cwd()
      captureTimeout: 7000
      autoWatch: false
      logLevel: 'ERROR'

      reporters: ['dots']
      browsers: ['Chrome']

      frameworks: ['jasmine', 'browserify']

      preprocessors: {
        '/test/tests/**/*.js': [ 'browserify' ]
      }

      browserify:
        debug: true
        transform: [
          'coffeeify'
          'brfs'
        ]
        extensions: ['.coffee']

      plugins: [
        'karma-jasmine'
        'karma-chrome-launcher'
        'karma-browserify'
      ]

      files: [
        'node_modules/jquery/dist/jquery.js'
        'node_modules/underscore/underscore.js'
        'node_modules/backbone/backbone.js'
        'dist/bundle.js'
        'test/tests/**/*.js'
      ]

    daemon:
      options:
        port: 3001
        singleRun: false
        background: true

    # This is useful for running the tests just once.
    once:
      options:
        singleRun: true
