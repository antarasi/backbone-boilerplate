module.exports = ->
  @loadNpmTasks 'grunt-contrib-concat'

  # Concat CSS files to one style.css in development mode
  @config 'concat',
    development:
      files:
        'dist/css/style.css': ['app/styles/compiled/*.css']
