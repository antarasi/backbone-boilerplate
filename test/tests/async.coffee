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
          console.log('testing async '+counter)
          caller(counter-1)

      , 100)

    caller(5)

  it 'should test api call', (done) ->
    user = 'antarasi'
    $.getJSON('https://api.github.com/users/'+user+'/repos')
    .done((data, textStatus, jqXHR) ->
      expect(data).toBeDefined()
      expect(data).toEqual(jasmine.any(Array))
      console.log('github tested')
      done()
    )
    .fail((jqXHR, textStatus) ->
      done.fail('textStatus: '+textStatus)
    )