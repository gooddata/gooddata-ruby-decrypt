# Gooddata::Crypto

[![Gem Version](https://badge.fury.io/rb/gooddata-crypto.svg)](https://badge.fury.io/rb/gooddata-crypto)

Simple library which usesl openssl to provide encryption and decryption functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gooddata-crypto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gooddata-crypto

## Usage

encrypt:
```
	Gooddata::Crypto.encrypt('Some secret string','supersecretencryptionkey')
```

decrypt:
```
	Gooddata::Crypto.decrypt("Vc+OmT3aA5BimjAt3alfFpz5wMSlVQHLwoFZLZ6FpeLcIZDEVHr9ET4Q55R0\nfm6W\n",'othersecretkey')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

 To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gooddata/gooddata-ruby-decrypt.

## License

The gem is available as open source under the terms of the [BSD License](https://opensource.org/licenses/BSD-3-Clause).
