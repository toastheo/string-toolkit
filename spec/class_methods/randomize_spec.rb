require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe ".randomize" do
    it "returns a string of the correct length" do
      expect(String.randomize.length).to eq(8)
      expect(String.randomize(10).length).to eq(10)
    end

    it "generates a random string each time" do
      string1 = String.randomize
      string2 = String.randomize
      expect(string1).not_to eq(string2)
    end

    it "contains only valid characters" do
      valid_chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + %w[! @ # $ % ^ & *]
      100.times do
        random_string = String.randomize(50)
        random_string.each_char do |char|
          expect(valid_chars).to include(char)
        end
      end
    end
  end
end