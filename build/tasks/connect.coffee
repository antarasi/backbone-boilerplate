module.exports = ->
  @loadNpmTasks 'grunt-contrib-connect'

  @config 'connect',
    options:
      hostname: 'localhost'
      port: 3000
      open: true
      base: 'dist'
      directory: 'dist'

    development:
      options:
        livereload: true
