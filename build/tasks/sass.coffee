module.exports = ->
  @loadNpmTasks 'grunt-contrib-sass'

  # Compile SASS files
  @config 'sass',
    release:
      files: [
        expand: true,
        cwd: 'app/styles',
        src: ['*.scss', '*.sass'],
        dest: 'app/styles/compiled',
        ext: '.css'
      ]
