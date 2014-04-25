'use strict'

angular.module('podcastApp')
.directive('levels', ->
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
			scope.spacing = scope.width / 4

		scope.focusOn = (index) ->
			scope.currentLevel = index

		scope.$watch 'currentLevel', (level) ->
			console.log "level changed to #{level}"

		# Bind to window resize
		angular.element('window').bind 'resize', ->
			calcWidth()

		# Calc the width on page load
		calcWidth()

  )
