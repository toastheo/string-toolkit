# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#word_count" do
    it "counts the word in a string" do
      expect("Hello world! This is great.".word_count).to eq(5)
    end

    it "returns 0 for an empty string" do
      expect("".word_count).to eq(0)
      expect(" ".word_count).to eq(0)
    end

    it "counts word without considering the case" do
      expect("Hello hello HELLO".word_count).to eq(3)
      expect("Hello hello HELLO".word_count(ignore_case: true)).to eq(1)
    end

    it "counts only the specified words" do
      expect("Hello world! This is great.".word_count(only: %w[Hello world])).to eq(2)
    end

    it "counts only the specified words without considering the case" do
      expect("Hello hello HELLO, this is great".word_count(ignore_case: true, only: "Hello")).to eq(1)
    end
  end
end
