# [/dev/kg](http://www.dev.kg)

Kyrgyzstan IT community platform.

![build status](https://travis-ci.org/Spalmalo/dev.kg.svg?branch=master)
[![Code Climate](https://codeclimate.com/github/Spalmalo/dev.kg/badges/gpa.svg)](https://codeclimate.com/github/Spalmalo/dev.kg)
[![Dependencies status](https://gemnasium.com/Spalmalo/dev.kg.png)](https://gemnasium.com/Spalmalo/dev.kg)
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

Open http://lvh.me:3000

## Deploy

Project is hosted on [heroku](https://heroku.com). [Travis CI](https://travis-ci.org/Spalmalo/dev.kg) is configured to deploy code automatically on successful build(database migrations included).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
