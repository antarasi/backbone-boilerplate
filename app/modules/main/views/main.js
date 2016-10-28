'use strict';

var ReposView = require('../../repos/views/repos');

module.exports = Backbone.View.extend({
	el: '#appview',

	render: function () {
		new ReposView({
			el: this.el
		});
	}
});
