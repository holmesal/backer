'use strict'

angular.module('podcastApp')
	.controller 'FeedCtrl', ($scope, $timeout, $window, feed) ->

		# Feed is injected by the router
		$scope.feed = feed

		$scope.subscribeText = 'Subscribed'

		$scope.subscribe = ->
			$scope.subscribed = true
			$timeout ->
				$scope.subscribeText = 'Opening in iTunes...'
				$timeout openDeeplink, 1000
			, 2000

		openDeeplink = ->
			$window.location = 'pcast://feeds.thisamericanlife.org/talpodcast'
			# Reset to subscribed button
			$timeout ->
				$scope.subscribeText = "Subscribed"
			, 1000
