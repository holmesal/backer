'use strict'

describe 'Directive: levels', ->

  # load the directive's module
  beforeEach module 'podcastApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<levels></levels>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the levels directive'
