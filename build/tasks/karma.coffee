module.exports = ->
  @loadNpmTasks 'grunt-karma'

  # Unit testing is provided by Karma.
  @config 'karma',
    options:
      basePath: process.cwd()
      captureTimeout: 7000
      autoWatch: false
      logLevel: 'ERROR'

      browsers: ['PhantomJS']

      frameworks: ['jasmine', 'browserify']

    # using {js,coffee} pattern causes Cannot read property 'mtime' of undefined
      preprocessors: {
        '/test/tests/**/*.js': [ 'browserify' ]
        '/test/tests/**/*.coffee': [ 'browserify' ]
      }

      coverageReporter:
        type : 'html' # or text
        dir : 'test/coverage/'

      plugins: [
        'karma-jasmine'
        'karma-phantomjs-launcher'
        'karma-browserify'
        'karma-coverage'
      ]

      files: [
        #libraries
        'node_modules/jquery/dist/jquery.js'
        'node_modules/underscore/underscore.js'
        'node_modules/backbone/backbone.js'
        #tests
        'test/tests/**/*.js'
        'test/tests/**/*.coffee'
        # test specs are autoWatched so exclude them to prevent running test twice
        {pattern: 'test/tests/**/*', watched: false, included: true, served: true}
      ]

    # tasks: --------------------------------------------

    daemon:
      options:
        port: 3001
        background: true
        singleRun: false
        autoWatch: true
        # how long to wait (in ms) after any changes have occurred before starting the auto-watch again.
        # if tests are run twice upon file change - increase the delay
        autoWatchBatchDelay: 1000

        reporters: ['dots']

        browserify:
          debug: true
          transform: [
            'coffeeify'
            'brfs'
          ]
          extensions: ['.coffee']

    # This is useful for running the tests just once.
    once:
      options:
        singleRun: true

        reporters: ['dots', 'coverage']

        browserify:
          debug: true
          transform: [
            'coffeeify'
            'brfs'
            'browserify-istanbul'
          ]
          extensions: ['.coffee']
