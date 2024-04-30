# frozen_string_literal: true

require "yaml"

# module which has further modules that are added to the String class
module StringToolkit
  def self.boolean_values
    @boolean_values = YAML.load_file(File.join(File.dirname(__FILE__), "../../config", "booleans.yml"))
  end

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
      return true if StringToolkit.boolean_values["true_values"].include?(upcase)
      return false if StringToolkit.boolean_values["false_values"].include?(upcase)

      nil
    end
  end
end
