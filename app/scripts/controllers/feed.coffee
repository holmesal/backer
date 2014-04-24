'use strict'

angular.module('podcastApp')
	.controller 'FeedCtrl', ($scope, $timeout, $window, feed) ->

		# Feed is injected by the router
		$scope.feed = feed

		# Mock out the feed levels, for now
		$scope.feed.levels = [
			cost: 1
			perks: ['Private Access to Pre-tape episode live feed (not available to the public)',
				'TWiST list Email Group',
				'Guaranteed seat at TWiST Live Events',
				'Twitter thank you',
				'First dibs to appear on Ask Jason']
		,
			cost: 10
			perks: ['This Week in Startups messenger bag',
				'25% off all LAUNCH event tickets',
				'Access to Show Discussions on Guests and Themes']
		, 
			cost: 20
			perks: ['On air thank you',
				'Bronze Pro Subscription to the LAUNCH Ticker (http://launch.co/promembership)',
				'Office Hours Golden Ticket for TWiST Live events',
				'Visit the Studio for a live taping!']
		]

		# Set level to -1, then init 1 second after page load
		$scope.currentLevel = -1
		$timeout ->
			$scope.currentLevel = 0
		, 1000


		# Subscribe / unsubscribe flow

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
