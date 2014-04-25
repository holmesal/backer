'use strict'

angular.module('podcastApp')
.directive('levels', ($timeout) ->
	templateUrl: 'views/directives/levels.html'
	restrict: 'E'
	scope:
		currentLevel: '=current'
		levels: '=all'
		levelUp: '&up'
		levelDown: '&down'
	link: (scope, element, attrs) ->

		# Set the width so it can be used to space the items
		calcWidth = ->
			scope.width = element.width()
			scope.hw = scope.width/2
			# Tablet -> desktop should see multiple options onscreen
			if window.outerWidth > 768
				scope.spacing = scope.width / 4
			# Mobile only sees one option
			else
				scope.spacing = scope.width

			# Force a digest cycle, if not already in one
			$timeout ->

		scope.focusOn = (index) ->
			scope.currentLevel = index

		scope.$watch 'currentLevel', (level) ->
			console.log "level changed to #{level}"

		# Bind to window resize
		angular.element(window).bind 'resize', ->
			calcWidth()

		# Calc the width on page load
		calcWidth()

  )
