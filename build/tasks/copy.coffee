module.exports = ->
  @loadNpmTasks 'grunt-contrib-copy'

  # copy main index.html file and other assets/*
  @config 'copy',
    index:
      files: [
        (src: 'app/index.html', dest: 'dist/index.html')
      ]

    assets:
      files: [
        (cwd: 'app/assets', src: '**', dest: 'dist/', expand: true)
      ]
