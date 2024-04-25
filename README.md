# StringToolkit

A Ruby gem which extends the ruby string class with some useful methods.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

Here is a list of all new methods added by gem with code examples:
- randomize: Returns a string of random characters.
```ruby
String.randomize()     # => "U!iAIWUn"
String.randomize(20)   # => "JRk#m#%ac@3wWi3@gG&O"
```

- capitalize_each_word: Capitalizes each word in a string.
```ruby
"good morning, you're beautiful!".capitalize_each_word    # => "Good Morning, You're Beautiful!"
```

- numceric?: Checks whether a string contains only numeric characters.
```ruby
"123.456".numeric?    # => true
"123Abc".numeric?     # => false
```

- palindrome?: Checks whether a character string represents a palindrome.
```ruby
"A man, a plan, a canal, Panama".palindrome?    # => true
"This is not a palindrome".palindrome?          # => false
```

- remove_whitespace: Removes all whitespaces.
```ruby
"  Hello\t\tWorld\n\n\r  ".remove_whitespace    # => "HelloWorld"
```

- to_phone: Converts a character string containing a telephone number into the telephone format corresponding to the transferred country code.
```ruby
"025550125".to_phone("US")    # => +1 202-555-0125
"030123456".to_phone("DE")    # => +49 30 123456
```

- to_slug: Creates a slug from the current string.
```ruby
"Hello person, how was your day?".to_slug    # => "hello-person-how-was-your-day"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toastheo/string_toolkit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
