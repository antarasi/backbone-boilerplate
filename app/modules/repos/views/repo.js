'use strict';

var Backbone = require('backbone');
var _ = require('underscore');

module.exports = Backbone.View.extend({
	tagName: 'li',
	template: _.template('<span><%- id %> - <%- name %><%- extension %></span>'),

	initialize: function() {
		this.listenTo(this.model, 'change', this.render);
	},

	render: function () {
		this.$el.html( this.template( this.model.attributes ) );
		return this;
	}
});
