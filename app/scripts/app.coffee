'use strict'

angular
  .module('podcastApp', [
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngRoute',
    'firebase',
    'ngAnimate'
  ])
  .config ($routeProvider, $locationProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        # templateUrl: 'views/podcast.html'
        # controller: 'PodcastCtrl'
      .when '/discover',
        templateUrl: 'views/discover.html'
        controller: 'DiscoverCtrl'
      .when '/login',
        templateUrl: 'views/login.html'
        controller: 'LoginCtrl'
      .when '/dashboard',
        templateUrl: 'views/dashboard.html'
        controller: 'DashboardCtrl'
      # Must be at the bottom, to miss all the other routes
      .when '/:vanity',
        templateUrl: 'views/feed.html'
        controller: 'FeedCtrl'
        resolve:
          feed: (Feed, $route) -> Feed.getFeed $route.current.params.vanity
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true

  .run ($rootScope, $location) ->

    # Don't allow shortnames to be the same as actual routes
    $rootScope.notAllowed = ['discover', 'login']

    $rootScope.firebaseURL = 'http://podcast.firebaseio.com'

    # If a route resolve is rejected, it'll throw a route change error
    # This means a user tried to access a route without being logged in
    # Or there was an error communicating with firebase
    $rootScope.$on '$routeChangeError', () ->
      console.log 'failed to change route - redirecting to landing'
      $location.path '/'

    # Attach fastclick
    FastClick.attach document.body

