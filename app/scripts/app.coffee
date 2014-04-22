'use strict'

angular
  .module('podcastApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        # templateUrl: 'views/main.html'
        # controller: 'MainCtrl'
        templateUrl: 'views/twist.html'
        controller: 'TwistCtrl'
      .when '/twist',
        templateUrl: 'views/twist.html'
        controller: 'TwistCtrl'
      .otherwise
        redirectTo: '/'

