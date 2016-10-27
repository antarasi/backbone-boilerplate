module.exports = ->
  @loadNpmTasks 'grunt-contrib-watch'

  # This will watch the application for changes and automatically reload the
  # page using LiveReload.
  @config 'watch',
    scripts:
      files: [
        'app/**/*.js'
        'app/**/*.coffee'
      ]
#			tasks: ['jshint']
      options:
        spawn: false
        livereload: true

    styles:
      files: [
        'app/**/*.scss'
        'app/**/*.sass'
      ]
      tasks: ['sass', 'concat:development']
      options:
        spawn: false
        livereload: true
