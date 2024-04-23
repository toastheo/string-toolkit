require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#remove_whitespace" do
    it "removes all whitespaces from the string" do
      expect("   Hello World  ".remove_whitespace).to eq("HelloWorld")
    end

    it "returns an empty string when called on an empty string" do
      expect("".remove_whitespace).to eq("")
    end

    it "removes all types of whitespaces characters" do
      expect("Hello\t\tWorld\n\n\r".remove_whitespace).to eq("HelloWorld")
    end
  end
end