'use strict'

angular.module('podcastApp')
	.controller 'FeedCtrl', ($scope, $timeout, $window, feed) ->

		# Feed is injected by the router
		$scope.feed = feed

		# Mock out the feed levels, for now
		$scope.feed.levels = [
			cost: 2
			name: 'Broke-Ass Fan'
			perks: ['Private Access to Pre-tape episode live feed (not available to the public)',
				'TWiST list Email Group',
				'Guaranteed seat at TWiST Live Events',
				'Twitter thank you',
				'First dibs to appear on Ask Jason']
		,
			cost: 10
			name: 'Fan'
			perks: ['This Week in Startups messenger bag',
				'25% off all LAUNCH event tickets',
				'Access to Show Discussions on Guests and Themes']
		, 
			cost: 20
			name: 'Super Fan'
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

		# Handle next/previous levels
		$scope.levelUp = ->
			if $scope.currentLevel < $scope.feed.levels.length - 1
				$scope.currentLevel += 1

		$scope.levelDown = ->
			if $scope.currentLevel > 0
				$scope.currentLevel -= 1

		# Handle requests for cover image. Ran out of ' and "
		$scope.getCoverImage = (feed) ->
			"url('#{feed.coverImage}')"

		# Handle arrow key presses
		$scope.$on 'keyDown', (event, data) ->
			console.log data
			console.log data.which
			switch data.which
				when 39
					$scope.levelUp()
				when 37
					$scope.levelDown()

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
