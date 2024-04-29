# frozen_string_literal: true

# rubocop:disable Style/GlobalVars

require "mkmf"
require "colorize"

conf = RbConfig::MAKEFILE_CONFIG

if conf["target_cpu"] == "arm64" && conf["target_os"].start_with?("darwin")
  $LIBPATH << "/opt/homebrew/lib"
  $INCFLAGS << " -I/opt/homebrew/include "
  $CXXFLAGS << " -I/opt/homebrew/include "
end

unless have_library("phonenumber") && have_library("protobuf")
  abort <<~MSG

    ,---------------------------------------------------------------------,
    |                                                                     |
    |  #{("=" * 50).to_s.colorize(:red)}                 |
    |  #{"OOPS, SOMETHING WENT WRONG!".colorize(:red)}                                        |
    |  #{("=" * 50).to_s.colorize(:red)}                 |
    |                                                                     |
    |  To use the string-toolkit gem, libphonenumber must be              |
    |  installed on your system.                                          |
    |                                                                     |
    |  But don't worry, fixing this should be quick.                      |
    |  Just follow these instructions:                                    |
    |                                                                     |
    |  1. Install the library:                                            |
    |                                                                     |
    |    On Mac:                                                          |
    |      #{"brew install libphonenumber".colorize(:green)}                                    |
    |                                                                     |
    |    On Debian / Ubuntu:                                              |
    |      #{"apt-get install -y libphonenumber-dev".colorize(:green)}                          |
    |                                                                     |
    |  2. Retry installing the gem (i.e. 'bundle install')                |
    |                                                                     |
    '---------------------------------------------------------------------'

  MSG
end

dir_config("string_toolkit")
append_cppflags("-03")
$CXXFLAGS << " -std=c++17 " unless $CXXFLAGS.include?("-std=c++")

create_makefile("string_toolkit/string_toolkit")

# rubocop:enable Style/GlobalVars
