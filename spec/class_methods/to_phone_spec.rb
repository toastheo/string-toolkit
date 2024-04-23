require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe ".to_phone" do
    it "formats the phone number" do
      expect("015732351125".to_phone("DE")).to eq(nil)
    end
  end
end