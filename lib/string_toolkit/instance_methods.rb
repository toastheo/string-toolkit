# frozen_string_literal: true

module StringToolkit
  # defines instance methods that are intended to be included in other classes
  module InstanceMethods
    def to_slug
      slug = downcase

      slug.gsub!(/[^a-z0-9-]+/, "-")

      slug.gsub!(/-+/, "-")

      slug.gsub!(/^-|-$/, "")

      slug
    end

    def palindrome?
      processed_content = downcase.gsub(/\W/, "")
      processed_content == processed_content.reverse
    end

    def capitalize_each_word
      gsub(/\b[\p{Alnum}']+\b/) { |match| match.&capitalize }
    end

    def numeric?
      !!Float(self)
    rescue StandardError
      false
    end

    def remove_whitespace
      gsub(/\s+/, "")
    end
  end
end
