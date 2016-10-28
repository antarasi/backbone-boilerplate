module.exports = ->
  @loadNpmTasks 'grunt-contrib-imagemin'

  # Run your source code through JSHint's defaults.
  @config 'imagemin',

    images:
      files: [
        expand: true,
        cwd: 'app/img/',
        src: ['**/*.{png,jpg,gif}'],
        dest: 'dist/img/'
    ]

    styles_images:
      files: [
        expand: true,
        cwd: 'app/styles/img/',
        src: ['**/*.{png,jpg,gif}'],
        dest: 'dist/css/img/'
      ]

