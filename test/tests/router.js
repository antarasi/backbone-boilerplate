'use strict';

// Test that the Router exists.
describe("Router", function() {

  it("is a Backbone Router", function() {
    var Router = require('../../app/router');

    // expect(Router).toBeUndefined();
    expect(Router).toBeDefined();
    expect(new Router()).toEqual(jasmine.any(Backbone.Router));
  });

});
