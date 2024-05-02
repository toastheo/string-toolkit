# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#to_currency" do
    it "formats the string as a currency amount" do
      expect("1234.56".to_currency("EUR")).to eq("€1.234,56")
    end

    it "formats the string as a currency amount with symbol in the end" do
      expect("1234.54".to_currency("FJD")).to eq("1,234.54 $")
    end

    it "raises an ArgumentError" do
      expect { "1234.56".to_currency("XXXX") }.to raise_error(ArgumentError, /Unsupported currency/)
    end

    it "formats large numbers correctly" do
      expect("12345678.90".to_currency("USD")).to eq("$12,345,678.90")
    end

    it "handles zero correctly" do
      expect("0".to_currency("USD")).to eq("$0.00")
    end

    it "handles negative numbers" do
      expect("-1234.56".to_currency("USD")).to eq("-$1,234.56")
    end
  end
end
