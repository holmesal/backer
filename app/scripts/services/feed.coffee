'use strict'

angular.module('podcastApp')
	.service 'Feed', ($rootScope, $firebase, $q) ->

		Feed = 

			getFeed: (feedName) ->
				console.log feedName
				# Defer the feed
				deferredFeed = $q.defer()

				# Set up the feed url
				feedRef = new Firebase "#{$rootScope.firebaseURL}/feeds/#{feedName}"
				# Check the feed on value
				feedRef.on 'value', (snapshot) ->
					feed = snapshot.val()
					console.log feed
					# If the feed exists, resolve
					if feed
						console.log 'got feed'
						deferredFeed.resolve feed
					else
						console.log 'no feed'
						deferredFeed.reject 'No feed exists!'
				, (err) ->
					console.error 'Error getting feed from firebase'
					console.error err

				return deferredFeed.promise
				
		return Feed


