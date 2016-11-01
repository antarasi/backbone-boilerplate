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
        middleware: (connect) -> [
          require('connect-livereload')()
          require('serve-static')('dist')
        ]

    release:
      options:
        keepalive: true
        base: 'dist'
