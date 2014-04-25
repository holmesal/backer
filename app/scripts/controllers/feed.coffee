'use strict'

angular.module('podcastApp')
	.controller 'FeedCtrl', ($scope, $timeout, $window, feed) ->

		# Feed is injected by the router
		$scope.feed = feed

		# Mock out the feed levels, for now
		$scope.feed.levels = [
			cost: 2
			name: 'Broke-Ass Fan'
			icon: 'grad'
			perks: [
					text: 'Private Access to Pre-tape episode live feed (not available to the public)'
				,
					text: 'TWiST list Email Group'
				,
					text: 'Guaranteed seat at TWiST Live Events'
				,
					text: 'Twitter thank you'
				,
					text: 'First dibs to appear on Ask Jason']
		,
			cost: 20
			name: 'Fan'
			icon: 'bbcap'
			perks: [
					text: 'This Week in Startups messenger bag'
				,
					text: '25% off all LAUNCH event tickets'
					image: 'http://www.valleyvet.com/images/worming-your-kitten.png'
				,
					text: 'Access to Show Discussions on Guests and Themes']
		, 
			cost: 100
			name: 'Super Fan'
			icon: 'crown'
			perks: [
					text: 'On air thank you'
				,
					text: 'Bronze Pro Subscription to the LAUNCH Ticker (http://launch.co/promembership)'
				,
					text: 'Office Hours Golden Ticket for TWiST Live events'
				,
					text: 'Visit the Studio for a live taping!']
		,
			cost: 200
			name: 'Uber Fan'
			icon: 'crown'
			perks: [
					text: 'On air thank you'
				,
					text: 'Bronze Pro Subscription to the LAUNCH Ticker (http://launch.co/promembership)'
				,
					text: 'Office Hours Golden Ticket for TWiST Live events'
				,
					text: 'Visit the Studio for a live taping!']
		]

		# Set level to -1, then init 1 second after page load
		$scope.currentLevel = -2
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
