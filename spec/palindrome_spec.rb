require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#palindrome?" do
    it "returns true for a palindrome" do
      expect("radar".palindrome?).to be true
    end

    it "returns false for a non-palindrome" do
      expect("hello".palindrome?).to be false
    end

    it "ignores non-alphanumeric characters and case" do
      expect("A man, a plan, a canal, Panama".palindrome?).to be true
    end
  end
end