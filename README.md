# Spalmalo on Rails

Spalmalo education platform

## Setup

Install gems:

    bundle

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
