'use strict';

var $ = require('jquery');
var MainView = require('./modules/main/views/main');

// The only thing that should be in a DOMReady
$(function() {
	var mainView = new MainView();
	mainView.render();
});
