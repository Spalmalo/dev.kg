# [/dev/kg](http://spalmalo-screencasts.herokuapp.com)

Kyrgyzstan IT community platform.

![build status](https://travis-ci.org/Spalmalo/dev.kg.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/Spalmalo/dev.kg/badges/gpa.svg)](https://codeclimate.com/github/Spalmalo/dev.kg)
[![Test Coverage](https://codeclimate.com/github/Spalmalo/dev.kg/badges/coverage.svg)](https://codeclimate.com/github/Spalmalo/dev.kg)
## Setup

Install gems:

    bundle

Setup environment variables:

    cp .env.example .env && nano .env

Update database configuration for development & test environments:

    cp config/database.yml.example config/database.yml && nano config/database.yml

Create databases for development & test environments:

    rake db:create && rake db:test:prepare

Run tests:

    rspec

Prepopulate database:

    rake db:populate

Run web-server:

    rails s

## Deploy

TODO: Add deploy notes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
