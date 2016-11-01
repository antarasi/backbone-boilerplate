'use strict';

module.exports = Backbone.Router.extend({
  routes: {
    '': 'index',
    "help":                 "help",    // #help
    "search/:query":        "search",  // #search/kiwis
    "search/:query/p:page": "search",   // #search/kiwis/p7

    '*notFound': 'notFound'
  },

  index: function () {
    $(function() {
      var MainView = require('./modules/main/views/main');
      var mainView = new MainView();
      mainView.render();
    });
  },
  help: function() {
    $(function() {
      $('#appview').html('help is called'); // stub
    });
  },
  search: function(query, page) {
    $('#appview').html('Q: ' + query + ' P: ' + page); // stub
  },

  notFound: function () {
    $('#appview').html('404 not found'); // stub, replace with your 404 page
  }
});