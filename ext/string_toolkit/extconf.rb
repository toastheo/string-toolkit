require "mkmf"

dir_config('phonenumber', '/usr/include/phonenumbers', '/usr/lib')

unless have_library('phonenumber', nil)
  abort "libphonenumber is missing!"
end

create_makefile('string_toolkit/string_toolkit_ext')