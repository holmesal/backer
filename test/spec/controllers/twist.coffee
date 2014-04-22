'use strict'

describe 'Controller: TwistCtrl', ->

  # load the controller's module
  beforeEach module 'podcastApp'

  TwistCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TwistCtrl = $controller 'TwistCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', ->
    expect(scope.awesomeThings.length).toBe 3
