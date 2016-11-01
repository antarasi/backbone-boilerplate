'use strict';

module.exports = Backbone.Router.extend({
  routes: {
    '': 'index',
    "help":                 "help",    // #help
    "search/:query":        "search",  // #search/kiwis
    "search/:query/p:page": "search"   // #search/kiwis/p7
  },

  index: function () {
    $(function() {
      var MainView = require('./modules/main/views/main');
      var mainView = new MainView();
      mainView.render();
    });
  },
  help: function() {
    console.log('help is called');
  },
  search: function(query, page) {

  }
});