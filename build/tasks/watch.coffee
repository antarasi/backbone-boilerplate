module.exports = ->
  @loadNpmTasks 'grunt-contrib-watch'

  @config 'watch',
    options:
      spawn: true
      livereload: true

    scripts:
      files: [
        'app/**/*.js'
        'app/**/*.coffee'
      ]
    # task is supported by browserify itself

    templates:
      files: [
        'app/**/*.html'
      ]
      tasks: ['copy:index']

    styles:
      files: [
        'app/**/*.scss'
        'app/**/*.sass'
      ]
      tasks: ['sass', 'concat:development']

    images:   # use ctrl+shift+R if reload does not work
      files: [
        'app/styles/img/**/*.{png,jpg,gif}'
        'app/img/**/*.{png,jpg,gif}'
      ]
      tasks: ['imagemin']

    assets:
      files: [
        'app/assets/**'
      ]
      tasks: ['copy:assets']