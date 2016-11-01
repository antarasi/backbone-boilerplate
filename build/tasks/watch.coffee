module.exports = ->
  @loadNpmTasks 'grunt-contrib-watch'

  @config 'watch',
    # run test on app scripts change & reload
    scripts:
      files: [
        'app/**/*.js'
        'app/**/*.coffee'
      ]
      tasks: ['karma:daemon:run']
      options:
        spawn: false
        livereload: true

    # run test on test specs change
    tests:
      files: [
        'test/tests/**/*.js'
      ]
      tasks: ['karma:daemon:run']
      options:
        spawn: false

    # copy files & reload on html change
    templates:
      files: [
        'app/**/*.html'
      ]
      tasks: ['copy', 'karma:daemon:run']
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
