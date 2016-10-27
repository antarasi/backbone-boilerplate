'use strict';

var Backbone = require('backbone');
var _ = require('underscore');
var ReposView = require('../../repos/views/repos');

module.exports = Backbone.View.extend({
	el: '#appview',

	render: function () {
		new ReposView({
			el: this.el
		});
	}
});
