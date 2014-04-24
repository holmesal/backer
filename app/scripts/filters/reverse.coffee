'use strict'

angular.module('podcastApp')
  .filter 'reverse', ->
    (input) ->
      input.slice().reverse()
