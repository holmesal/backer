'use strict'

angular.module('podcastApp')
  .directive('navbar', ->
    templateUrl: 'views/directives/navbar.html'
    restrict: 'E'
    link: (scope, element, attrs) ->
      # element.text 'this is the navbar directive'
  )
