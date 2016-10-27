module.exports = ->
  @loadNpmTasks 'grunt-contrib-watch'

  # This will watch the application for changes and automatically reload the
  # page using LiveReload.
  @config 'watch',
		scripts:
			files: [
				'app/**/*.js'
				'app/main.js'
			]
#			tasks: ['jshint']
			options:
				spawn: false
				livereload: true

