'use strict';

var fs = require('fs');
var template = fs.readFileSync(__dirname + '/repo.html', 'utf8');

module.exports = Backbone.View.extend({
	tagName: 'li',
	template: _.template(template),

	initialize: function() {
		this.listenTo(this.model, 'change', this.render);
	},

	render: function () {
		this.$el.html( this.template( this.model.attributes ) );
		return this;
	}
});