# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#obfuscate" do
    it "replaces the specified range of characters with a given character" do
      expect("1234-5678-Abcd-1121".obfuscate(start: 4, finish: 14)).to eq("1234-****-****-1121")
    end

    it "handles different obfuscation characters" do
      expect("1234-5678-Abcd-1121".obfuscate(start: 4, finish: 14, char: "#")).to eq("1234-####-####-1121")
    end

    it "returns the original string when start and end are out of bounds or start greater than end" do
      expect("1234-5678-Abcd-1121".obfuscate(start: 25, finish: 35)).to eq("1234-5678-Abcd-1121")
      expect("1234-5678-Abcd-1121".obfuscate(start: -1, finish: 1)).to eq("1234-5678-Abcd-1121")
      expect("1234-5678-Abcd-1121".obfuscate(start: 10, finish: 5)).to eq("1234-5678-Abcd-1121")
    end

    it "replaces all characters if strict flag is set" do
      expect("1234-5678-Abcd-1121".obfuscate(start: 4, finish: 14, strict: true)).to eq("1234***********1121")
    end
  end
end
