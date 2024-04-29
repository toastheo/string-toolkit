# frozen_string_literal: true

module StringToolkit
  # defines class methods that are intended to extend other classes
  module ClassMethods
    def randomize(length = 8, options = {}) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      digits = ("0".."9").to_a
      lower_case = ("a".."z").to_a
      upper_case = ("A".."Z").to_a
      special_chars = %w[! @ # $ % ^ & *]

      source = []
      source += digits if options[:digits] != false
      source += lower_case if options[:lower_case] != false
      source += upper_case if options[:upper_case] != false
      source += special_chars if options[:special_chars] != false

      raise ArgumentError, "At least one character set must be included." if source.empty?

      Array.new(length) { source.sample }.join
    end
  end
end
