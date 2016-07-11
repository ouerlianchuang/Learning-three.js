'use strict'

var gulp = require('gulp'),
coffee = require('gulp-coffee');

var paths = {
    coffee: ['./begin/coffee/*.coffee'],
};

gulp.task('coffee', function() {
  gulp.src(paths.coffee)
    .pipe(coffee({bare: true}))
    .pipe(gulp.dest(function(e){
        var string = e.path.match(/Learning-three.js\/.+\/coffee\/.+\.js/g)[0];
        var path = './' + string.substring(17,string.indexOf('coffee')) + 'js/';
        return(path)
    }));
});

gulp.task('watch', function() {
  gulp.watch(paths.coffee, ['coffee']);
});

