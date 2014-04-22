'use strict'

angular.module('podcastApp')
	.controller 'PodcastCtrl', ($scope, $timeout, $window) ->

		$scope.subscribeText = 'Subscribed!'
	

		$scope.subscribe = ->
			$scope.subscribed = true
			$timeout ->
				$scope.subscribeText = 'Opening in iTunes...'
				$window.location = 'pcast://feeds.thisamericanlife.org/talpodcast'
			, 2000
