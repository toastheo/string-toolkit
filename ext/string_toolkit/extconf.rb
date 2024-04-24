# frozen_string_literal: true

# rubocop:disable Style/GlobalVars

require "mkmf"

conf = RbConfig::MAKEFILE_CONFIG

if conf["target_cpu"] == "arm64" && conf["target_os"].start_with?("darwin")
  $LIBPATH << "/opt/homebrew/lib"
  $INCFLAGS << " -I/opt/homebrew/include "
  $CXXFLAGS << " -I/opt/homebrew/include "
end

unless have_library("phonenumber") && have_library("protobuf")
  warn <<~MSG

    WARNING: It looks like libphonenumber is not installed on this system.
    libphonenumber is required to use the to_phone method.

    If you are not planning to use to_phone ignore this message.
    Otherwise you can follow these steps to install the lib:

    On Mac:
      brew install libphonenumber

    On Debian / Ubuntu:
      apt-get install -y libphonenumber-dev

  MSG
end

dir_config("string_toolkit")
append_cppflags("-03")
$CXXFLAGS << " -std=c++17 " unless $CXXFLAGS.include?("-std=c++")

create_makefile("string_toolkit/string_toolkit")

# rubocop:enable Style/GlobalVars
