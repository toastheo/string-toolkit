# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#to_slug" do
    it "converts mixed-case string to lower case" do
      expect("HelloWorld".to_slug).to eq("helloworld")
    end

    it "replaces spaces and underscores with dashes" do
      expect("hello world_hello_world".to_slug).to eq("hello-world-hello-world")
    end

    it "removes special characters" do
      expect("hello!@#world$%^&".to_slug).to eq("hello-world")
    end

    it "collapses multiple dashes into a single dash" do
      expect("hello--world".to_slug).to eq("hello-world")
    end

    it "trims dashes from the start and end of the string" do
      expect("-hello-world-".to_slug).to eq("hello-world")
    end

    it "uses a custom seperator" do
      expect("hello world hello world".to_slug("+")).to eq("hello+world+hello+world")
    end

    it "uses a custom seperator with multiple chars" do
      expect("hello world hello world".to_slug("=+=")).to eq ("hello=+=world=+=hello=+=world")
    end
  end
end
