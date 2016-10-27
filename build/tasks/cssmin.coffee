module.exports = ->
  @loadNpmTasks 'grunt-contrib-cssmin'

  # Minify the distribution CSS.
  @config 'cssmin',
    release:
      files:
        'dist/css/style.css': ['app/styles/compiled/*.css']
