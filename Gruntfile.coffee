module.exports = ->

  # Load task configurations.
  @loadTasks "build/tasks"

  # Run JSHint and a quick test.
  @registerTask "test", [
    "browserify:testing"
    "karma:run"
  ]

  # During development: lint the code, build out the development bundle, run
  # the connect server, and watch for changes.
  @registerTask "development", [
    "browserify:development"
    "browserify:testing"
		"processhtml"
		"copy"
    "connect:development"
    "watch"
  ]

  # During production: lint, build out assets, and run tests.
  @registerTask "production", [
    "clean"
    "browserify:production"
    "browserify:testing"
    "processhtml"
    "copy"
    "cssmin"
#    "karma:run"
  ]

  # Alias to development.
  @registerTask "default", ["development"]
