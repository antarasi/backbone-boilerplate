# Backbone Boilerplate

Comprehensive foundation for Backbone-based modular web application that works!
### Backbone + CoffeeScript + Browserify + SASS/SCSS + Image-min + Jasmine

Based on **Grunt** task runner and created with latest versions of NPM dependencies.
Application can consist of scripts written in **JavaScript** and **CoffeeScript** as well
This boilerplate contains Backbone application example with sample test specs to let you easily dive into the workflow.

## Getting started

### Prerequisites

You must have [Node.js](https://nodejs.org) and [GIT](https://git-scm.com/) installed.

### Installation

```
# Clone repository
 git clone https://github.com/antarasi/backbone-boilerplate.git

# Rename directory to your own project name
 mv backbone-boilerplate my-project

# Need to go deeper
 cd my-project

# Install dependencies
 npm install
```

Optionally:
```
# Remove existing git data
 rm -rf .git

# And create your own repository
 git init
 git add .
 git commit -m "Initial"
```

### Running

There are 3 main tasks to run:
1. `npm start` (equivalent to `grunt development` or just `grunt`)
  - create browserify bundle
  - compile SASS
  - copy assets
  - minify images
  - create local dev server
  - run tests
  - watch for changes
2. `npm build` (equivalent to `grunt production`)
  - create browserify bundle (minified)
  - compile SASS (minified)
  - copy assets
  - minify images
  - run tests once
3. `npm test` (equivalent to `grunt test`)
  - run tests once

## Workflow

### Backbone application files
Backbone files should be placed in `app/modules/<modulename>`. Each module should have its Backbone directory structure, for instance:
```
app
  modules
     repositories
       collections
         repos.js
         ...
       models
         repo.coffee
         ...
       views
         repo.html
         repo.js
         repos.js
         ...
```

You can also place general purpose scripts (custom 404 view for instance) directly in `app/modules/` `app/collections/` and `app/views/`.

### Backbone bootstraping

Application root file is `app/main.js` that depends on `app/router.js` and all `app/modules/*` files that are bundled together using Browserify `require()` into `dist/bundle.js`.
`main` is the default module that is invoked in `app/router.js`
 ```javascript
 index: function () {
     $(function() {
       var MainView = require('./modules/main/views/main');
       var mainView = new MainView();
       mainView.render();
     });
   },
 ```

Requests that does not match any pattern in Router are resolved by `notFound` function.

### index.html

Main `index.html` file that is initially served to client's browser contains

- Favicon
- Compiled stylesheet
- MainView container (for main module)
- External libraries
- Generated application bundle

> Find out why external libraries are not bundled together with application scripts in **Global libraries** section

### External templates

Browserify bundler is configured to be able to fetch external html templates instead of inlining them in your Backbone.View scripts.

For example we have a module with the following files in views dir:
```
 views
   repo.html
   repo.js
   ...
```

repo.html
```
<span><%- name %></span>
```

repo.js:
```
'use strict';

var fs = require('fs');
var template = fs.readFileSync(__dirname + '/repo.html', 'utf8');

module.exports = Backbone.View.extend({
  ...
  template: _.template(template),
  ...
});
```

> jQuery, Underscore and Backbone scripts are globally available so we don't have to `require()` them. Find out more in **Global libraries** section.

Then in generated `dist/bundle.js` the above code fragment will be compiled into

```
'use strict';

var template = "<span><%- name %></span>";

module.exports = Backbone.View.extend({
  ...
  template: _.template(template),
  ...
});
```

### Styles

All styles (SASS / SCSS / CSS) sould be located in `app/styles/` dir to be properly compiled into `dist/css/style.css`.
Task runner will create temporary `app/styles/compiled/` dir for SASS/SCSS equivalents in plain CSS with source maps.

### Images and assets

Images should be located in `app/img/` and `app/styles/img/` to be properly minified.

`app/img/*` images will be relocated to `dist/img/`
`app/styles/img/*` images will be relocated to `dist/css/img/`

All other assets should be placed in `app/assets` dir and will be relocated to `dist/`.

Relocation respects original directory structure.

## Global libraries

The reasons why I don't bundle libraries like jQuery or Backbone together with application scripts:

1. Making libraries exposed as global variables makes your code simpler and cleaner. You no longer have to put `var Backbone = require('backbone')` in each header of your scripts.
2. Encapsulating all libraries within one bundle.js significantly increases load time (~50%) at slower connections.
3. Including libraries as separate script tags from CDN allows the browser to load them simultaneously.

More details about that approach is described [here](http://stackoverflow.com/questions/40308908/browserify-global-variable-for-library-security-and-performance)

### How to add another global library

#### Install library by node package manager
Download and save as a dependency
```
npm install <libraryname> --save
```

Add your library script from CDN (same version) in `/index.html` file before bundle.js
```html
<script src="https://cdn.source.com/libraryname/1.0.0/libraryname-min.js"></script>
<script src="bundle.js"></script>
```

Make your local library script available for test specs in `build/tasks/karma.coffee`
```
files: [
  #libraries
  'node_modules/jquery/dist/jquery.js'
  'node_modules/underscore/underscore.js'
  'node_modules/backbone/backbone.js'
  'node_modules/libraryname/libraryname.js' <------ here
  ...
]
```

#### or download library contents
into `app/vendor/<libraryname>` dir and include in `/index.html` before bundle.js
```html
<script src="app/vendor/libraryname/libraryname.min.js"></script>
<script src="bundle.js"></script>
```

Make your library script available for test specs in `build/tasks/karma.coffee`
```
files: [
  #libraries
  'node_modules/jquery/dist/jquery.js'
  'node_modules/underscore/underscore.js'
  'node_modules/backbone/backbone.js'
  'app/vendor/libraryname/libraryname.js' <------ here
  ...
]
```

> If your library size is small and used only in few scripts, consider bundling it together with application scripts and `require('libraryname')` explicitly where needed because advantages of globalizing it are barely distinguishable then.

## Testing

`Karma` is used as a test runner, `Jasmine` as test framework.
Tests are run on `PhantomJS` - a headless WebKit based browser.
You can change browser that runs test to:

 - Chrome
 - ChromeCanary
 - Firefox
 - Opera
 - Safari (only Mac)
 - IE (only Windows)

#### Changing to Google Chrome example:

1. Install Chrome launcher
  `npm install --save-dev karma-chrome-launcher`
2. Edit `build/tasks/karma.coffee`:
  a) change `browsers` from `PhantomJS` to `Chrome`
  b) change `plugins` from `karma-phantomjs-launcher` to `karma-chrome-launcher`

You can write tests in `.js` and `.coffee` as well.
Test specs (including examples) are located in `test/tests` dir.
`npm build` and `npm test` tasks generate code coverage to `test/coverage` dir for each browser separately.

####

## Watch

After running `npm start` task, Grunt watches your files for changes and refreshes browser contents with livereload when needed.

 - `app/*.js` or `app/*.coffee` changes => `dist/bundle.js` is created and reloaded
 - `app/*.html` template changes => `dist/bundle.js` is created and reloaded
 - `app/*.scss` or `app/*.sass` style changes => SASS compiles to `dist/css/style.css`
 - `app/style/img/*` images changes => png, jpg and gif files are minified into `dist/css/img/`
 - `app/img/*` images changes => png, jpg and gif files are minified into `dist/img`
 - `test/tests/*.js` or `test/tests/*.coffee` changes => test are run

## License

Licensed under the MIT license.
Inspired by @tbranyen and @quartzmo projects
Created by Adrian Matylewicz @antarasi
[![Adrian Matylewicz on LinkedIn](https://s.gravatar.com/avatar/d1e746ab1e3a3edd7b77b46be006753d?s=39)](https://pl.linkedin.com/in/adrian-matylewicz) [![Adrian Matylewicz on LinkedIn](http://www.antara.pl/img/footer/icon-linkedin.png)](https://pl.linkedin.com/in/adrian-matylewicz)
