###
  leaf-typography's Gruntfile
  Author: Matheus R. Kautzmann
  Description:
    Build the project files, three main modes are available:

    * grunt watch = while developing features or fixing bugs, keeps running
    scss compilation with source maps to test with the demo HTML.

    * grunt demo = Compiles everything with source maps and spins up a server
    running the demo.

    * grunt build = Builds for distribution and output to dist.

    Also, there are some individual grunt tasks, for more info run `grunt help`

  Attention contributors: check the CONTRIBUTING.md file before sending changes.
###
module.exports = (grunt) ->

  require('load-grunt-tasks')(grunt)

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json')

    # Lint all the CoffeeScript files
    coffeelint: {
      app: {
        files: {
          src: ['Gruntfile.coffee']
        }
      }
      test: {
        files: {
          src: ['test/*.coffee']
        }
      }
      options: {
        configFile: 'coffeelint.json'
      }
    }

    # Compile test code
    coffee: {
      test: {
        options: {
          bare: true
          sourceMap: true
        }
        files: {
          'test/testBundle.js': ['test/*.coffee']
        }
      }
    }

    # Lint SCSS files
    scsslint: {
      options: {
        bundleExec: true
        config: '.scss-lint.yml'
      }
      src: ['src/*.scss']
    }

    # Compile SCSS
    sass: {
      options: {
        bundleExec: true
      }
      demo: {
        files: {
          'demo/leaf-typography.css': 'src/leaf-typography.scss'
        }
        options: {
          style: 'expanded'
        }
      }
      test: {
        files: {
          'test/leaf-typography.css': 'src/leaf-typography.scss'
        }
        options: {
          style: 'expanded'
        }
      }
      dist: {
        files: {
          'dist/leaf-typography.css': 'src/leaf-typography.scss'
        }
        options: {
          style: 'expanded'
          sourcemap: 'none'
        }
      }
    }

    # Run tests on PhantomJS
    mocha: {
      test: {
        src: ['test/index.html']
        options: {
          run: true
          reporter: 'Spec'
        }
      }
    }

    # Apply PostCSS transformations to generate complete distribution file
    postcss: {
      distProd: {
        options: {
          map: false
          processors: [
            require('cssnano')({autoprefixer: false, safe: true})
          ]
        }
        src: 'dist/leaf-typography.css'
        dest: 'dist/leaf-typography.min.css'
      }
      test: {
        options: {
          map: true
          processors: [
            require('cssnano')({autoprefixer: false, safe: true})
          ]
        }
        src: 'test/leaf-typography.css'
      }
    }

    # Put banner in dist files
    usebanner: {
      taskName: {
        options: {
          position: 'top',
          banner: '/*<%=pkg.name %>@<%=pkg.version%>*/',
          linebreak: true
        },
        files: {
          src: ['dist/*.css', 'dist/*.scss']
        }
      }
    }

    # Export raw SCSS file
    copy: {
      main: {
        src: 'src/leaf-typography.scss'
        dest: 'dist/_leaf-typography.scss'
      }
    }

    # Generate docs
    sassdoc: {
      default: {
        options: {
          dest: 'docs'
        }
        src: 'src/leaf-typography.scss'
      }
    }

    # Run connect server for testing purposes
    connect: {
      server: {
        options: {
          port: 8080
          base: '.'
        }
      }
    }

    # Run demo server with auto CSS update
    browserSync: {
      bsFiles: {
        src: ['demo/*.css', 'demo/*.html']
      }
      options: {
        server: {
          baseDir: './demo'
        }
      }
    }

    # Runs browser tests on Sauce Labs (only Circle CI must run it)
    'saucelabs-mocha': {
      all: {
        options: {
          username: process.env.SAUCE_USERNAME
          key: process.env.SAUCE_ACCESSKEY
          urls: ['localhost:8080/test/index.html']
          testname: 'leaf-typography'
          build: 'build-leaf-typography-' + process.env.CIRCLE_BUILD_NUM
          pollInterval: 5000
          'max-duration': 500
          maxRetries: 1
          browsers: grunt.file.readJSON('browserSupport.json').browsers
        }
      }
    }

    # Watch task while developing
    watch: {
      options: {
        spawn: false
      }
      sass: {
        files: ['src/*.scss']
        tasks: ['lint', 'sass:demo']
      }
      test: {
        files: ['test/*.coffee']
        tasks: ['coffee']
      }
    }

    # Take back to clone state
    clean: [
      'bower_components'
      'node_modules'
      'docs'
      'test/leaf-typography.css'
      'test/leaf-typography.css.map'
      'test/testBundle.js'
      'test/testBundle.js.map'
    ]
  })

  grunt.registerTask('lint', ['coffeelint', 'scsslint'])
  grunt.registerTask('test', [
    'lint'
    'coffee'
    'sass:test'
    'postcss:test'
    'mocha'
  ])
  grunt.registerTask('docs', ['sassdoc'])
  grunt.registerTask('demo', ['sass:demo', 'browserSync'])
  grunt.registerTask('build', [
    'test',
    'sass:dist'
    'postcss:distProd'
    'docs'
    'copy'
    'usebanner'
  ])
  if process.env.CI
    grunt.registerTask('ci', [
      'build'
      'connect'
      'saucelabs-mocha'
    ])
