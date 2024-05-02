# frozen_string_literal: true

require "json"

# module which has further modules that are added to the String class
module StringToolkit
  module Helpers
    def self.boolean_values
      @boolean_values = YAML.load_file(File.join(File.dirname(__FILE__), "../../config", "booleans.yml"))
    end

    def self.load_currency_settings
      file_path = File.join(File.dirname(__FILE__), "../../config/currencies.json")
      json_content = File.read(file_path)
      JSON.parse(json_content)
    end

    CURRENCY_SETTINGS = load_currency_settings.freeze
  end
end
