#URLockbox

URLockbox is a small application at https://murmuring-thicket-81764.herokuapp.com/ that allows a user to enter a url and have it hit another application to rank how many times the url has been read at https://nameless-coast-56698.herokuapp.com/reads

## Table of Contents
- [Heroku](#heroku)
- [Getting Started](#getting-started)
- [FAQ](#faq)
- [Requirements](#requirements)
  - [Ruby on Rails](#ror)
- [Installation](#installation)
- [Testing](#testing)
- [Gems](#gems)
- [Technology](#technology)
- [Author](#author)
- [License](#license)

### [Heroku](#heroku)
* production: https://murmuring-thicket-81764.herokuapp.com/

### [Getting Started](#getting-started)

  1. After installation, a user can create an account to use the site.  After a user creates an account there password and login will be saved to the database for future logins.

  2. Once the user has created an account they are taken to the main page where they can start logging their favorite sites.

    * All sites must be in http:// format for the site to be logged.
    * All sites must have a title for the site to be logged as well.  
    * Once a site is marked read, it is counted towards a hot read.  The user may mark them as unread after and the count will adjust accordingly.
    * The user may sort their sites by read/unread as well as search for a specific site by what is shown in the url.

### [FAQ](#faq)
1. What do I do with the app?
  - This simple app is designed so a user can create an account and login to record his/her favorite sites?

2. What is a hot read?
  - After a site is recorded it shows up in the main app.  A user can then mark this link as read or not read.  After a site is marked read it is recorded in the hot links on another application at: https://nameless-coast-56698.herokuapp.com/reads.  The top 10 sites read within the last 24 hours are recorded and kept in the list.  On the main app, if the site is in the top ten, it is listed as hot.  The top site is listed at top site.

3. Where are the sites recorded?
  - The hot list is recorded at https://nameless-coast-56698.herokuapp.com/reads

## [Requirements](#requirements)
### [Ruby on Rails](#ror)
```
RAILS VERSION
  - 5.0.0.1

RUBY VERSION
  - 2.3.0p0

BUNDLED WITH
  - 1.13.7
```

### [Installation](#installation)

####Clone the repository:
  
  ```
  https://github.com/MDes41/URLockbox
  ```

####Bundle application
  
  ```
  bundle install
  ```

####Create and migrate database

  ```
  rake db:create db:migrate
  ```

### [Testing](#testing)

### Testing with PhantomJS using poltergeist

The app has phantom.js, a headless webdriver installed for JS testing.

#### Setup

To set it up you will just need to run `npm install phantomjs` from within your project folder. Everything else will be installed with Bundle.

#### Use

You can then write capybara feature tests and add `js: true` tag to each test the has JavaScript.  Your tests will execute and recognize your JavaScript.

If you're having problems troubleshooting asynchronous actions (like DOM changes after an AJAX request), [peruse this section of Capybara's docs](https://github.com/teamcapybara/capybara#asynchronous-javascript-ajax-and-friends)

#### Your JavaScript

The major __GOTCHA__ here is that phantomjs doesn't recognize es6. So if you write es6 you will need to make your file extenstion `.js.es6`. You should see an example test in the `spec/features` directory.

### [Gems](#gems)

- 'rspec-rails'
- 'capybara'
- 'launchy'
- 'simplecov', :require => false
- 'database_cleaner'
- 'factory_girl_rails'
- 'shoulda-matchers'
- 'poltergeist'
- 'jquery-rails'
- 'jbuilder', '~> 2.0'
- 'rails_12factor', group: :production
- 'awesome_print'
- 'bcrypt', '~> 3.1.7'
- 'better_errors', group: :development
- 'sprockets-es6'
- 'bootstrap-sass'
- 'heroku'
- 'faraday'

* Please check the Gemfile for a list of all gems used in the app.

### [Technology](#technology)

The application is currently using the following technlogies:

Server: Ruby On Rails 5.0.1
Database: PostgreSQL
Libraries: JQuery, Axios

### [Author](#author)

* Matt DeMarteau - [MDes41](https://github.com/mdes41)

## [License](#license)

* Copyright <2015> <Matt DeMarteau>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.