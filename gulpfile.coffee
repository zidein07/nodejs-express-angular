gulp = require 'gulp'
jade = require 'gulp-jade'

gulp.task 'jade', ->
  gulp.src 'public/jade/*.jade'
    .pipe do jade
    .pipe gulp.dest 'public/dist'