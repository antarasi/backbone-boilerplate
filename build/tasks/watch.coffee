module.exports = ->
  @loadNpmTasks 'grunt-contrib-watch'

  @config 'watch',
    options:
      spawn: true
      livereload: true

    # reload scripts upon change
    scripts:
      files: [
        'app/**/*.js'
        'app/**/*.coffee'
      ]
#      tasks: ['karma:daemon:run']

    # copy files & reload on html change
    templates:
      files: [
        'app/**/*.html'
      ]
      tasks: ['copy', 'karma:daemon:run']

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

#  grunt.event.on('watch', (action, filepath) ->
#      console.log('--------------------------------------------- WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW')
#  )
