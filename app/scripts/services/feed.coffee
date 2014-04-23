'use strict'

angular.module('podcastApp')
	.service 'Feed', ($rootScope, $firebase, $q) ->

		

		# Check if the feed exists
		# feed

		# # Do the damn thing
		# feed = new FirebaseSimpleLogin rootRef, (err, authUser) ->
		# 	if err
		# 		# console.error 'There was an error getting the authUser from firebase'
		# 		# console.error err
		# 		# Reject the promise
		# 		deferredAuthUser.reject err
		# 	else if authUser
		# 		# console.log 'authUser is logged in!'
		# 		# console.log authUser
		# 		$rootScope.authUser = authUser
		# 		# Resolve the promise
		# 		# console.log 'resolving promise'
		# 		deferredAuthUser.resolve authUser
		# 	else
		# 		# Pretty sure this will be called when the user hits logout as well
		# 		# console.log 'no user is logged in!'
		# 		$rootScope.authUser = null
		# 		$rootScope.user = null
		# 		# Reject the promise - this will throw a routeChangeError
		# 		# console.log 'rejecting promise!'
		# 		deferredAuthUser.reject 'No user is logged in'

		# # Defer the firebase user
		# deferredUser = $q.defer()

		# # After the auth user resolves, kick of this promise resolution
		# deferredAuthUser.promise.then (authUser) ->
		# 	# console.log 'deferred auth user resolved successfully!'
		# 	# Bind the firebase user to the root scope
		# 	userRef = rootRef.child('users').child(authUser.id)
		# 	$rootScope.user = $firebase userRef
		# 	# Watch it for updates
		# 	$rootScope.$watch 'user', (user) ->
		# 		# If the user exists, resolve the deferredUser promise
		# 		if user
		# 			deferredUser.resolve user


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

				# # If the user already exists, return that. Otherwise, return a promise
				# if $rootScope.user
				# 	return $rootScope.user
				# else
				# 	return deferredUser.promise

		return Feed


