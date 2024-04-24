# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#capitalize_each_word" do
    it "capitalizes each word in a string, treating punctuation as word boundaries" do
      expect("hello world.i am a person".capitalize_each_word).to eq("Hello World.I Am A Person")
      expect("good morning, you're beautiful!".capitalize_each_word).to eq("Good Morning, You're Beautiful!")
      expect("123 abc;def".capitalize_each_word).to eq("123 Abc;Def")
    end

    it "handles strings with no alphabetic characters" do
      expect("123456!@#\$".capitalize_each_word).to eq("123456!@#\$")
    end

    it "handles empty strings" do
      expect("".capitalize_each_word).to eq("")
    end

    it "handles string that are already capitalized" do
      expect("Hello World.I Am A Person".capitalize_each_word).to eq("Hello World.I Am A Person")
    end
  end
end
