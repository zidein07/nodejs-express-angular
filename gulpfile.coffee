gulp = require 'gulp'
jade = require 'gulp-jade'
less = require 'gulp-less'
browserSync = require('browser-sync').create()

gulp.task 'jade', ->
  gulp.src 'public/jade/*.jade'
  .pipe do jade
  .pipe gulp.dest 'public/dist'


gulp.task 'less', ->
  gulp.src 'public/less/*.less'
  .pipe do less
  .pipe gulp.dest 'public/dist/style'

gulp.task 'connect', ->
  browserSync.init
    files: [
      'public/jade/*.jade'
      'public/less/*.less'
    ]
    port: 3000
    logConnections: true
    notify: false
    server: 'public/dist'

gulp.task 'watch', ->
  gulp.watch 'public/jade/*.jade', ['jade']
  gulp.watch 'public/less/*.less', ['less']

gulp.task 'default', ['jade', 'less', 'watch', 'connect']