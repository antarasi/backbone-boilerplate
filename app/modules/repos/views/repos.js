'use strict';

var ReposCollection = require('../collections/repos');
var RepoView = require('./repo');

var antaraReposCollection = new ReposCollection(null, {
	user: 'antarasi'
});

module.exports = Backbone.View.extend({
	template: _.template('<ul id="repo-list"></ul>'),

	initialize: function () {
		//el defined in parent

		var thiz = this;
		antaraReposCollection.fetch({
			reset: true
		}).done(function () {
			thiz.handleFetch();
		}).fail(function (jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
			console.log(errorThrown);
			thiz.handleError();
		});
	},

	render: function() {
		this.$el.html(this.template);
		return this;
	},

	addOne: function (repo) {
		var view = new RepoView({ model: repo });
		this.$('#repo-list').append( view.render().el );
	},

	handleFetch: function () {
		this.render();
		antaraReposCollection.each(this.addOne, this);
	},
	handleError: function () {
		this.render();
		this.$el.html('Błąd wczytywania');
	}
});
