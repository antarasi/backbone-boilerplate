module.exports = ->
  @loadNpmTasks 'grunt-contrib-connect'

  @config 'connect',
    options:
      hostname: 'localhost'
      port: 3000
      open: true
      base: 'dist'

    development:
      options:
        livereload: true
        middleware: (connect) -> [
          require('serve-static')('dist')
        ]
