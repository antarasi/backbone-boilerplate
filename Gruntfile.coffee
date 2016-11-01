module.exports = ->

  # Load task configurations.
  @loadTasks "build/tasks"

  # Run JSHint and a quick test.
  @registerTask "test", [
    "karma:once"
  ]

  # During development: lint the code, build out the development bundle, run
  # the connect server, and watch for changes.
  @registerTask "development", [
    "browserify:development"
    "sass"
    "concat:development"
		"copy"
    "imagemin"
    "connect:development"
    "karma:daemon:start watch"
    "watch"
  ]

  # During production: lint, build out assets, and run tests.
  @registerTask "production", [
    "clean"
    "browserify:production"
    "sass"
    "cssmin"
    "copy"
    "imagemin"
    "karma:once"
  ]

  # Alias to development.
  @registerTask "default", ["development"]
