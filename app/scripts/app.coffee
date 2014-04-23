'use strict'

angular
  .module('podcastApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'firebase'
  ])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        # templateUrl: 'views/podcast.html'
        # controller: 'PodcastCtrl'
      .when '/:vanity',
        templateUrl: 'views/feed.html'
        controller: 'FeedCtrl'
        resolve:
          feed: (Feed, $route) -> Feed.getFeed $route.current.params.vanity
      .otherwise
        redirectTo: '/'

  .run ($rootScope, $location) ->

    $rootScope.firebaseURL = 'http://podcast.firebaseio.com'

    # If a route resolve is rejected, it'll throw a route change error
    # This means a user tried to access a route without being logged in
    # Or there was an error communicating with firebase
    $rootScope.$on '$routeChangeError', () ->
      console.log 'failed to change route - redirecting to landing'
      $location.path '/'

