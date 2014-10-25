var configureKarma = function (configuration) {
    configuration.set({
        basePath: '../',
        logLevel: 'DEBUG',
        browsers: ['PhantomJS'],

        preprocessors: {
            'src/main/webapp/partials/**/*.html': ['ng-html2js']
        },

        ngHtml2JsPreprocessor: {
            stripPrefix: 'src/main/webapp',
            moduleName: 'templates'
        },

        // Read from YAML instead?
        files: [
            '../../main/javascript/vendor/angular/angular.js',
            '../../main/javascript/vendor/angular-route/angular-route.js',
            '../../main/javascript/config/modules.js',
            '../../main/javascript/config/routes.js',
            '../../main/javascript/factories/*',
            '../../main/javascript/repositories/*',
            '../../main/javascript/controllers/*',
            '../../main/templates/*'
        ],

        exclude: [],

        autoWatch: false,

        frameworks: ['jasmine'],

        plugins: [
            'karma-phantomjs-launcher',
            'karma-jasmine',
            'karma-ng-html2js-preprocessor'
        ],

        singleRun: true
    })
};

module.exports = configureKarma;