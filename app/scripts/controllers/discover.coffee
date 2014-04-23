'use strict'

angular.module('podcastApp')
  .controller 'DiscoverCtrl', ($scope, $rootScope, $firebase) ->
    
  	# Go grab a bunch of feeds from firebase
  	feedsRef = new Firebase "#{$rootScope.firebaseURL}/feeds"
  	$scope.feeds = $firebase feedsRef