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
        templateUrl: 'views/podcast.html'
        controller: 'PodcastCtrl'
      .when '/podcast',
        templateUrl: 'views/podcast.html'
        controller: 'PodcastCtrl'
      .otherwise
        redirectTo: '/'

