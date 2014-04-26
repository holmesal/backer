'use strict'

angular.module('podcastApp')
	.directive('odometer', ($timeout) ->
		templateUrl: 'views/directives/odometer.html'
		restrict: 'E'
		replace: true
		scope:
			cost: "="
		link: (scope, element, attrs) ->

			# Init the odometer
			scope.hundredsOdo = new Odometer
				el: element.children()[1]
				value: scope.hundreds || 0
			scope.tensOdo = new Odometer
				el: element.children()[2]
				value: scope.tens || 0
			scope.onesOdo = new Odometer
				el: element.children()[3]
				value: scope.ones || 0



			# Set to the starting value in a second
			# $timeout ->
			# 	unless scope.changed
			# 		scope.odo.update scope.cost
			# , 5000

			# Break a cost into individual elements
			calcCosts = ->

				if scope.cost
					# costString = scope.cost.toString()

					# ones = costString[2] || 0
					scope.ones = scope.cost % 10
					scope.onesOdo.update scope.ones

					# tens = costString[1] || 0
					scope.tens = Math.floor(scope.cost % 100 / 10)
					scope.tensOdo.update scope.tens

					# hundreds = costString[0] || 0
					scope.hundreds = Math.floor(scope.cost % 1000 / 100)
					scope.hundredsOdo.update scope.hundreds

					# console.log costString
					# console.log "#{costString[0]}, #{costString[1]}, #{costString[2]}"

			# Watch the cost and update the odometer
			scope.$watch 'cost', (cost) ->
				scope.changed = true
				# scope.odo.update cost

				calcCosts()
	)
