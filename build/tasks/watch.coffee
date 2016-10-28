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

    templates:
      files: [
        'app/**/*.html'
      ]
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

    images:   # use ctrl+shift+R if reload does not work
      files: [
        'app/styles/img/**/*.{png,jpg,gif}'
        'app/img/**/*.{png,jpg,gif}'
      ]
      tasks: ['imagemin']
      options:
        spawn: false
        livereload: true
