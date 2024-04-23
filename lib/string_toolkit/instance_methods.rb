# frozen_string_literal: true

module StringToolkit
  module InstanceMethods
    def to_slug
      slug = self.downcase

      slug.gsub!(/[^a-z0-9\-]+/, '-')

      slug.gsub!(/-+/, '-')

      slug.gsub!(/^-|-$/, '')

      slug
    end

    def palindrome?
      processed_content = self.downcase.gsub(/\W/, '')
      processed_content == processed_content.reverse
    end
  end
end