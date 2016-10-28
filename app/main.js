'use strict';

var MainView = require('./modules/main/views/main');

// for IE no transport error.
// THE FOLLOWING LINE SHOULD BE REMOVED IF YOU WON'T USE CROSS ORIGIN REQUESTS
$.support.cors = true;

// on DOMReady
$(function() {
	var mainView = new MainView();
	mainView.render();
});
