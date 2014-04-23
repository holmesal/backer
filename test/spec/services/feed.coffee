'use strict'

describe 'Service: Feed', ->

  # load the service's module
  beforeEach module 'podcastApp'

  # instantiate service
  Feed = {}
  beforeEach inject (_Feed_) ->
    Feed = _Feed_

  it 'should do something', ->
    expect(!!Feed).toBe true
