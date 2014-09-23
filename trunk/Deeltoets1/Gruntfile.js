module.exports = function(grunt) {

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),

        less: {
            development: {
                options: {
                    paths: ['css/less'],
                    compress: true,
                    yuicompress: true,
                    optimisation: 2
                },
                files: {
                    'css/main.css' : 'css/less/main.less'
                }
            }
        },

        concat: {   
		    dist: {
		        src: [
                    'js/vendor/transparency.min.js',
                    'js/vendor/underscore-min.js',
                    'js/vendor/routie.min.js',
                    'js/models/JsonModel.js',
                    'js/views/View.js',
                    'js/controller/JsonModel.js',
                    'js/controller/Controller.js',
                    'js/controller/AboutController.js',
                    'js/controller/MoviesController.js',
                    'js/App.js',
                ],
		        dest: 'js/all.min.js',
		    }
		},

		uglify: {
		    build: {
		        src: 'js/all.min.js',
		        dest: 'js/all.min.js'
		    }
		},

		watch: {
		    scripts: {
		        files: ['css/less/*.less', 'js/*/*.js'],
		        tasks: ['less', 'concat'],
		        options: {
		            spawn: false,
		        },
		    } 
		}


    });

    // 3. Where we tell Grunt we plan to use this plug-in.
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');

    // 4. Where we tell Grunt what to do when we type "grunt" into the terminal.
    grunt.registerTask('default', ['concat', 'uglify', 'watch']);

};







