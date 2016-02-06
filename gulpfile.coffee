
gulp       = require 'gulp'
source     = require 'vinyl-source-stream'
browserify = require 'browserify'
coffeeify  = require 'coffeeify'

# automatically load gulp plugins
$ = require('gulp-load-plugins')(
  pattern: [
    'gulp-*'
    'gulp.*'
  ]
  replaceString: /\bgulp[\-.]/)

gulp.task 'coffeelint', ->
  gulp.src 'app/scripts/**/*.coffee'
  .pipe $.cached( 'js' )
  .pipe $.coffeelint()
  .pipe($.coffeelint.reporter())
  .pipe($.coffeelint.reporter('fail'))
  .pipe $.util.noop()

gulp.task 'clean', ->
  gulp.src('dist/**/*')
  .pipe($.clean(force: true))


browserifyTask = (t) ->
  gulp.task "#{t}.coffee", ->
    browserify
      entries: ["./app/scripts/#{t}.coffee"]
      extensions: ['.coffee', '.js']
    .transform coffeeify
    .bundle()
    # Pass desired file name to browserify with vinyl
    .pipe source "#{t}.js"
    # Start piping stream to tasks!
    .pipe gulp.dest 'dist/js'

browserifyTask "angular-phone-format", true

gulp.task 'index', ->
  target = gulp.src('./app/templates/index.html')
  sources = gulp.src([
    './app/scripts/**/*.js'
    './app/styles/**/*.css'
  ], read: false, relative: true)
  target.pipe($.inject(sources))
  .pipe gulp.dest('./test')


gulp.task 'default', ['clean', 'coffeelint', 'angular-phone-format.coffee'], ->
  gulp.src(['app/scripts/**/*.coffee', '!app/scripts/**/angular-phone-format.coffee'])
  .pipe $.coffee()
  .pipe gulp.dest 'dist/js/'