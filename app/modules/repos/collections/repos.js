'use strict';

var Backbone = require('backbone');
var Repo = require('../models/repo');

module.exports = Backbone.Collection.extend({
	model: Repo,
	dataType: 'jsonp',
	url: function () {
		return 'https://api.github.com/users/'+this.user+'/repos';
	},
	initialize: function (models, options) {
		this.user = options.user;
	}
});
