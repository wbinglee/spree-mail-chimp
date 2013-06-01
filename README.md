# Spree + Mail Chimp

[![Build Status](https://secure.travis-ci.org/futhr/spree-mail-chimp.png?branch=master)](http://travis-ci.org/futhr/spree-mail-chimp)
[![Dependency Status](https://gemnasium.com/futhr/spree-mail-chimp.png)](https://gemnasium.com/futhr/spree-mail-chimp)
[![Coverage Status](https://coveralls.io/repos/futhr/spree-mail-chimp/badge.png?branch=master)](https://coveralls.io/r/futhr/spree-mail-chimp)

**NOTE: THIS FORK IS WIP FOR SPREE 2.x**

MailChimp API integration for your Spree store, using the hominid gem.

Adds a checkbox to the user signup form to allow customer to opt-in to your Mailchimp mailing list. Mailchimp API calls happen via the hominid gem.

Mailchimp subscription status is tracked with a boolean flag on the users table, we also fetch and store the unique MC record id when the subscription is created. This allows us to modify existing email addresses with minimal fuss.

This is a very simple extension as of now, *any ideas suggestions or improvements welcome!*

## Subscription form partial with JS

Also includes a partial at `shared/newsletter_subscribe_form` that can be included in your footer or sidebar anywhere on the site, has one field for the email address. jQuery code in `public/javascripts/mailchimp_subscribe.js` will POST to the SubscriptionsController which will relay to Mailchimp.

The SimpleModal plugin is used in the EJB to pop up a confirmation or error alert (because you won't be satisfied with a simple alert() box)

### Installation

Add to project's Gemfile:
```ruby
gem 'spree_mail_chimp'
```

Run from project's root:
```ruby
bundle install

rails g spree_mail_chimp:install
```

### Configuration

See the Mail Chimp Settings forms in the Admin under Configuration.

### Changes

V.3.0.24	Embedded jquery.simplemodal.js in _newsletter_subscribe.html.erb
		Added First Name, Last Name, and Zip Code fields

### Requirements

* Spree >= 2.0
* hominid ~> 3.0.5 http://rubygems.org/gems/hominid

### Credits

Authored by Sam Beam @sbeam
Migrated to Spree 0.30 by Bastian Schnurle @bzt
Migrated to Spree 1.0 (and extensively refactored) by James Kong @jkongie
Repaired missing jqurey.simplemodal, added fields for names, zip code by Jerrold Thompson @bluehandtalking
Inspired originally by https://github.com/softa/mailee_spree

Includes SimpleModal http://www.ericmmartin.com/projects/simplemodal/

### TODO

* Export new orders to Mailchimp for full CRM gnarliness
* Utility to export existing users to Mailchimp
* Add admin controller to view lists and subscriptions
* Allow for multiple lists
* Tests :/
* Use mailchimp-gem or gibbon instead
* Remove simple modal use plain jsonp
* Fix translations

### Contributing

* Fork the repo
* Clone your repo `git clone git@github.com:mrhelpful/spree-unifaun.git`
* Create branch for your pull request `git checkout -b fix-something`
* Run `bundle`
* Run `bundle exec rake test_app` to create the test application in `spec/dummy`
* Make your changes
* Ensure specs pass by running `bundle exec rake`
* Make sure yor changes has test coverage `open coverage/index.html`
* Submit your pull request

Copyright (c) 2013 Sam Beam, released under the New BSD License
