# frozen_string_literal: true

require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe "#extract_emails" do
    it "returns an array of email addresses found in the string" do
      expect("Contact us at example@example.com or support@foo.com".extract_emails).to eq(["example@example.com",
                                                                                           "support@foo.com"])
    end

    it "returns an empty array when no emails are present" do
      expect("Hello, world!".extract_emails).to eq([])
    end

    it "ignores invalid email formats" do
      expect("Reach us at example.com or at email@.com".extract_emails).to eq([])
    end

    it "converts to lowercase" do
      expect("Contact Example@Example.COM for more info".extract_emails).to eq(["example@example.com"])
    end
  end
end
