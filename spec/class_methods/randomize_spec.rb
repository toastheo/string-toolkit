# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

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
      valid_chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a + %w[! @ # $ % ^ & *]
      100.times do
        random_string = String.randomize(50)
        random_string.each_char do |char|
          expect(valid_chars).to include(char)
        end
      end
    end

    it "allows excluding digits" do
      100.times do
        random_string = String.randomize(10, digits: false)
        expect(random_string).not_to match(/[0-9]/)
      end
    end

    it "allows excluding lowercase letters" do
      100.times do
        random_string = String.randomize(10, lower_case: false)
        expect(random_string).not_to match(/[a-z]/)
      end
    end

    it "allows excluding uppercase letters" do
      100.times do
        random_string = String.randomize(10, upper_case: false)
        expect(random_string).not_to match(/[A-Z]/)
      end
    end

    it "allows excluding special characters" do
      100.times do
        random_string = String.randomize(10, special_chars: false)
        expect(random_string).not_to match(/[!@#$%^&*]/)
      end
    end

    it "raises an error if no character set is included" do
      expect do
        String.randomize(10, digits: false, lower_case: false, upper_case: false, special_chars: false)
      end.to raise_error(ArgumentError)
    end
  end
end

# rubocop:enable Metrics/BlockLength
