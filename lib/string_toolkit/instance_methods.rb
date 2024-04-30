# frozen_string_literal: true

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
  end
end
