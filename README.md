# StringToolkit

A Ruby gem which extends the ruby string class with some useful methods.

## Installation

1. **Install all the necessary libraries:**
    
    ```sh
    brew install libphonenumber                # for MacOS
    ```
    ```sh
    apt-get install -y libphonenumber-dev      # for Debian / Ubuntu
    ```

2. **Install the gem**

    Add this to your gemfile:
    ```ruby
    gem "[NOT RELEASED YET]"
    ```
    and than execute:
    ```sh
    bundle install
    ```
    
    or alternatively if bundler is not used to manage dependencies, install the gem by executing:
    ```sh
    gem install "[NOT RELEASED YET]"
    ```

## Usage

### Description
- **randomize**: Returns a string of random characters.
### Parameters
- `length`: Optional. The length of the random string to generate. Default is 8 characters.
- `options`: Optional. A hash to specify which types of characters to include or exclude:
    - `digits`: Include digits(0-9).
    - `lower_case`: Include lowercase letters (a-z)
    - `upper_case`: Include uppercase letters (A-Z)
    - `special_chars`: Include special characters(!@#$%^&*)
### Example
```ruby
String.randomize()                                                                  # => "U!iAIWUn"
String.randomize(20)                                                                # => "JRk#m#%ac@3wWi3@gG&O"
String.randomize(15, { digits: false, lower_case: false, special_chars: false })    # => "QWRNNYMHZVGLWTG"
```

---

### Description
- **capitalize_each_word**: Capitalizes each word in a string.
### Example
```ruby
"good morning, you're beautiful!".capitalize_each_word    # => "Good Morning, You're Beautiful!"
```

---

### Description
- **numceric?**: Checks whether a string contains only numeric characters.
### Example
```ruby
"123.456".numeric?    # => true
"123Abc".numeric?     # => false
```

---

### Description
- **palindrome?**: Checks whether a character string represents a palindrome.
### Example
```ruby
"A man, a plan, a canal, Panama".palindrome?    # => true
"This is not a palindrome".palindrome?          # => false
```

---

### Description
- **remove_whitespace**: Removes all whitespaces.
### Example
```ruby
"  Hello\t\tWorld\n\n\r  ".remove_whitespace    # => "HelloWorld"
```

---

### Description
- **to_phone**: Converts a character string containing a phone number into the phone format corresponding to the transferred country code.
(Throws an exception if the phone number or the country code is invalid.)
### Parameters
- `country_code`: The country code to be used.
### Example
```ruby
"2025550125".to_phone("US")    # => +1 202-555-0125
"030123456".to_phone("DE")     # => +49 30 123456
```

---

### Description
- **to_slug**: Creates a slug from the current string.
### Parameters
- `seperator`: Optional. The selected separator. Can also be a string of any characters.
### Example
```ruby
"Hello person, how was your day?".to_slug          # => "hello-person-how-was-your-day"
"Hello person, how was your day?".to_slug("==")    # => "hello==person==how==was==your==day"
```

---

### Description
- **extract_emails**: Extracts all e-mail addresses from a string.
### Example
```ruby
"Contact us at example@example.com or Support@FOO.com"  # => ["example@example.com", "support@foo.com"]
```

## Development

If you are using Visual Studio Code (VS Code) as your development environment, I provide a baseline configuration in the `.vscode` directory to help you get started. This includes predefined settings for C/C++ development, debugging, and formatting.

**Important Note:** The settings in the `.vscode` directory may include paths and configurations specific to my development setup. I recommend reviewing and adjusting these settings to fit your local environment. This may involve modifying paths in `settings.json` and `c_cpp_properties.json` to match your local installations and toolchains.

Please ensure that these adjustments are made on your local copy only and are not pushed back to the repository to maintain general compatibility for all developers.

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toastheo/string_toolkit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
