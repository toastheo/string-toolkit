# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

# just test some of the yml translations
RSpec.describe String do
  describe "#to_boolean" do
    it "returns true" do
      expect("Y".to_boolean).to eq(true)
      expect("YES".to_boolean).to eq(true)
      expect("TRUE".to_boolean).to eq(true)
    end

    it "returns false" do
      expect("N".to_boolean).to eq(false)
      expect("NO".to_boolean).to eq(false)
      expect("FALSE".to_boolean).to eq(false)
    end
  end
end
