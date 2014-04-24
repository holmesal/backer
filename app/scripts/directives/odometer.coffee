'use strict'

angular.module('podcastApp')
.directive 'odometer', ($timeout) ->
	template: '<div class="odometer">100</div>'
	restrict: 'E'
	replace: true
	scope:
		cost: "="
	link: (scope, element, attrs) ->

		# Init the odometer
		scope.odo = new Odometer
			el: element[0]
			value: scope.cost || 0

		# Set to the starting value in a second
		# $timeout ->
		# 	unless scope.changed
		# 		scope.odo.update scope.cost
		# , 5000

		# Watch the cost and update the odometer
		scope.$watch 'cost', (cost) ->
			scope.changed = true
			scope.odo.update cost

