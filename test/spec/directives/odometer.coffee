'use strict'

describe 'Directive: odometer', ->

  # load the directive's module
  beforeEach module 'podcastApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<odometer></odometer>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the odometer directive'
