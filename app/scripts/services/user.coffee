'use strict'

angular.module('podcastApp')
	.service 'User', ($rootScope, $firebase, $firebaseSimpleLogin, $q) ->

		# Defer the auth user
		deferredAuthUser = $q.defer()

		# Not using $firebaseSimpleLogin - I think the callback model is a better fit here, to provide concrete did login / not logged in stages
		rootRef = new Firebase $rootScope.firebaseURL
		# Do the damn thing
		auth = new FirebaseSimpleLogin rootRef, (err, authUser) ->
			if err
				# console.error 'There was an error getting the authUser from firebase'
				# console.error err
				# Reject the promise
				deferredAuthUser.reject err
			else if authUser
				# console.log 'authUser is logged in!'
				# console.log authUser
				$rootScope.authUser = authUser
				# Resolve the promise
				# console.log 'resolving promise'
				deferredAuthUser.resolve authUser
			else
				# Pretty sure this will be called when the user hits logout as well
				# console.log 'no user is logged in!'
				$rootScope.authUser = null
				$rootScope.user = null
				# Reject the promise - this will throw a routeChangeError
				# console.log 'rejecting promise!'
				deferredAuthUser.reject 'No user is logged in'

		# Defer the firebase user
		deferredUser = $q.defer()

		# After the auth user resolves, kick of this promise resolution
		deferredAuthUser.promise.then (authUser) ->
			# console.log 'deferred auth user resolved successfully!'
			# Bind the firebase user to the root scope
			userRef = rootRef.child('users').child(authUser.id)
			$rootScope.user = $firebase userRef
			# Watch it for updates
			$rootScope.$watch 'user', (user) ->
				# If the user exists, resolve the deferredUser promise
				if user
					deferredUser.resolve user


		User = 

			getAuthUser: ->
				# If the user has been authed previously, return an object, and the route will change instantly
				if $rootScope.authUser
					# console.log 'returning auth user!'
					return $rootScope.authUser
				# Otherwise, return a promise - the route will change when it resolves
				# Or it will redirect to landing if it rejects
				else
					# console.log 'returning promise!'
					return deferredAuthUser.promise

			getUser: ->
				# If the user already exists, return that. Otherwise, return a promise
				if $rootScope.user
					return $rootScope.user
				else
					return deferredUser.promise

		return User


