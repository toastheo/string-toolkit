# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#numeric?" do
    it "returns true for valid integer" do
      expect("123".numeric?).to be true
    end

    it "returns true for valid float" do
      expect("3.14".numeric?).to be true
    end

    it "returns true for negative numbers" do
      expect("-10".numeric?).to be true
    end

    it "return false for a string with numbers and letters" do
      expect("1a".numeric?).to be false
    end

    it "returns false for a pure alphabetic string" do
      expect("abc".numeric?).to be false
    end

    it "returns false for an empty string" do
      expect("".numeric?).to be false
    end

    it "returns false for a string with spaces" do
      expect("   ".numeric?).to be false
    end
  end
end
