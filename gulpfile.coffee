gulp = require 'gulp'
jade = require 'gulp-jade'
less = require 'gulp-less'
coffee = require 'gulp-coffee'
compressCss = require 'gulp-minify-css'
compressJs = require 'gulp-uglify'
browserSync = require('browser-sync').create()

gulp.task 'jade', ->
  gulp.src [
    'public/views/*.jade'
  ]
  .pipe do jade
  .pipe gulp.dest 'public/dist/tpl'
  browserSync.reload

gulp.task 'less', ->
  gulp.src 'public/less/main.less'
  .pipe do less
  .pipe do compressCss
  .pipe gulp.dest 'public/dist/style'
  browserSync.reload


gulp.task 'coffee', ->
  gulp.src [
    'public/coffee/controllers/*.coffee'
    'public/coffee/*.coffee'
  ]
  .pipe do coffee
  .pipe do compressJs
  .pipe gulp.dest 'public/dist/angular'
  browserSync.reload 'public/dist/*.*'


gulp.task 'connect', ['jade', 'less'], ->
  browserSync.init
    proxy: 'localhost'
    files: [
      'public/views/*.jade'
      'public/less/*.less'
    ]

  gulp.watch 'public/views/*.jade', ['jade']
  gulp.watch 'public/less/*.less', ['less']
  gulp.watch [
    'public/coffee/*.coffee'
    'public/coffee/**/*.coffee'
  ], ['coffee']


gulp.task 'default', ['connect']