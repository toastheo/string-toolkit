# frozen_string_literal: true

require_relative "string_toolkit/class_methods"
require_relative "string_toolkit/instance_methods"

require_relative "string_toolkit/error"
require_relative "string_toolkit/version"

require_relative "../string_toolkit"

class String
  include StringToolkit::InstanceMethods
  extend StringToolkit::ClassMethods
end