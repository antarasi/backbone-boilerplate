'use strict';

var fs = require('fs');

describe("Simple tests examples", function() {
  it("should detect true", function() {
    expect(true).toBe(true);
  });

  it("should increments values", function() {
    var mike = 0;

    expect(mike++).toBe(0);
    expect(mike).toBe(1);
  });
});

describe("Tests with before/after hooks", function() {
  var a = 0;

  beforeEach(function() {
    a++;
  });

  afterEach(function() {
    a = 0
  });

  it("should increment value", function() {
    expect(a).toBe(1);
  });

  it("should reset after each test", function() {
    expect(a).toBe(1);
  });
});
