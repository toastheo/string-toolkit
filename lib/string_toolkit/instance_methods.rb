# frozen_string_literal: true

require "yaml"

# module which has further modules that are added to the String class
module StringToolkit
  # defines instance methods that are intended to be included in other classes
  module InstanceMethods
    def to_slug(separator = "-")
      slug = downcase

      slug.gsub!(/[^a-z0-9-]+/, separator)

      slug.gsub!(/#{Regexp.escape(separator)}+/, separator)

      slug.gsub!(/^#{Regexp.escape(separator)}|#{Regexp.escape(separator)}$/, "")

      slug
    end

    def palindrome?
      processed_content = downcase.gsub(/\W/, "")
      processed_content == processed_content.reverse
    end

    def capitalize_each_word
      gsub(/\b[\p{Alnum}']+\b/, &:capitalize)
    end

    def numeric?
      !!Float(self)
    rescue StandardError
      false
    end

    def remove_whitespace
      gsub(/\s+/, "")
    end

    def extract_emails
      scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i).map(&:downcase)
    end

    def obfuscate(start:, finish:, char: "*", strict: false) # rubocop:disable Metrics/CyclomaticComplexity
      return dup if start > finish || start.negative? || finish >= length

      modified_string = dup

      modified_string.length.times do |i|
        next unless i >= start && i <= finish

        modified_string[i] = char if modified_string[i].match?(/[0-9A-Za-z]/) || strict
      end

      modified_string
    end

    def word_count(ignore_case: false, only: nil) # rubocop:disable Metrics/CyclomaticComplexity
      words = scan(/\p{Word}+/)

      words = words.map(&:downcase) if ignore_case

      if only
        only = Array(only).map(&:downcase) if ignore_case
        words = words.select { |word| only.include?(word) }
      end

      words.uniq! if ignore_case

      words.size
    end

    def to_boolean
      return true if StringToolkit::Helpers.boolean_values["true_values"].include?(upcase)
      return false if StringToolkit::Helpers.boolean_values["false_values"].include?(upcase)

      nil
    end

    def to_currency(currency_code) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
      settings = StringToolkit::Helpers::CURRENCY_SETTINGS[currency_code.downcase]

      raise ArgumentError, "Unsupported currency" unless settings

      formatted_amount = format("%.2f", self).split(".")
      integer_part = formatted_amount[0]
      decimal_part = formatted_amount[1]
      symbol = settings["symbol"]
      thousands_separator = settings["thousands_separator"]
      decimal_mark = settings["decimal_mark"]
      symbol_first = settings["symbol_first"]

      integer_part_with_delimiters = integer_part.chars.to_a.reverse.each_slice(3)
                                                 .map(&:join).join(thousands_separator).reverse

      if symbol_first
        formatted_currency = if integer_part.start_with?("-")
                               "-#{symbol}#{integer_part_with_delimiters[1..]}#{decimal_mark}#{decimal_part}"
                             else
                               "#{symbol}#{integer_part_with_delimiters}#{decimal_mark}#{decimal_part}"
                             end
      else
        formatted_currency = "#{integer_part_with_delimiters}#{decimal_mark}#{decimal_part} #{symbol}"
      end

      formatted_currency
    end
  end
end
