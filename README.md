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
    gem "string_toolkit"
    ```
    and than execute:
    ```sh
    bundle install
    ```
    
    or alternatively if bundler is not used to manage dependencies, install the gem by executing:
    ```sh
    gem install "string_toolkit"
    ```

## Usage

A complete list of all new methods available, instructions for use and code examples can be found here: [USAGE](/docs/USAGE.md)

## Development

If you are using Visual Studio Code (VS Code) as your development environment, I provide a baseline configuration in the `.vscode` directory to help you get started. This includes predefined settings for C/C++ development, debugging, and formatting.

**Important Note:** The settings in the `.vscode` directory may include paths and configurations specific to my development setup. I recommend reviewing and adjusting these settings to fit your local environment. This may involve modifying paths in `settings.json` and `c_cpp_properties.json` to match your local installations and toolchains.

Please ensure that these adjustments are made on your local copy only and are not pushed back to the repository to maintain general compatibility for all developers.

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toastheo/string-toolkit.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
