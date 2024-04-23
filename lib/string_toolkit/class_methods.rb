# frozen_string_literal: true

module StringToolkit
  module ClassMethods
    def randomize(length = 8)
      source = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + %w[! @ # $ % ^ & *]
      random_string = Array.new(length) { source.sample }.join
    end
  end
end