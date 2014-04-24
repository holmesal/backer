'use strict'

angular.module('podcastApp')
.controller 'DashboardCtrl', ($scope) ->

	$scope.feed = 
		name: 'This Week in Startups'
		stats:
			hits: 6302
			subscribers: 1302
			lastChange: 'video'
		subscribers: [
			name: 'Alonso Holmes'
			level: 
				id: 0
				name: 'Broke-Ass Fan'
			perks:
				qualified: 5
				redeemed: 4
		,
			name: 'Matthew Kulp'
			level: 
				id: 1
				name: 'Fan'
			perks:
				qualified: 5
				redeemed: 2
		,
			name: 'Ethan Sherr'
			level: 
				id: 2
				name: 'Super Fan'
			perks:
				qualified: 5
				redeemed: 0
		]