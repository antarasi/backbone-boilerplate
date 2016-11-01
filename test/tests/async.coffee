'use strict';

describe "Asynchronous specs", ->

  value = null

  beforeEach (done) ->
    setTimeout(->
      value = -5
      done()
    , 1)

  it 'should test async beforeEach function', (done) ->
    value++ # should be -5 after beforeEach is done, so value++ = -4
    expect(value).toBe(-4)
    done()

  it 'should test async timeout function', (done) ->
    caller = (counter) ->
      setTimeout(->

        if (counter <= 0)
          done()
        else
          console.log(counter)
          caller(counter-1)

      , 500)

    caller(5)

