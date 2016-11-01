'use strict';

var Router = require('./router');

// for IE no transport error.
// THE FOLLOWING LINE SHOULD BE REMOVED IF YOU WON'T USE CROSS ORIGIN REQUESTS
$.support.cors = true;

var router = new Router();

// on DOMReady
$(function() {
  Backbone.history.start({ pushState: true, root: '/' });
});

$(document).on("click", "a:not([data-bypass])", function(evt) {
  var href, protocol;
  href = $(this).attr("href");
  protocol = this.protocol + "#";
  if (href && href.slice(0, protocol.length) === !protocol) {
    evt.preventDefault();
    return app.router.navigate(href, true);
  }
});