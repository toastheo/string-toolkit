require "spec_helper"
require "string_toolkit"

RSpec.describe String do
  describe ".to_phone with valid inputs" do
    it 'formats a valid US phone number correctly' do
      expect("2025550125".to_phone("US")).to eq("+1 202-555-0125")
    end

    it 'formats a valid DE phone number correctly' do
      expect("030123456".to_phone("DE")).to eq("+49 30 123456")
    end
  end

  describe 'with invalid inputs' do
    it 'raises an ArgumentError if country code is not a string' do
      expect { "2025550125".to_phone(123) }.to raise_error(ArgumentError)
    end

    it 'raises a StandardError for an invalid number' do
      expect { "abcdefg".to_phone("US") }.to raise_error(StandardError, /Invalid number/)
    end

    it 'raises a StandardError for an invalid country code' do
      expect { "2025550125".to_phone("XX") }.to raise_error(StandardError, /Invalid country code/)
    end
  end

  describe 'error handling' do
    it 'handles number being invalid' do
      expect { "123456".to_phone("US") }.to raise_error(StandardError, /Phone number is invalid/)
    end

    it 'handles number being too long' do
      expect { "12345678901234567890".to_phone("US") }.to raise_error(StandardError, /Phone number is too long/)
    end
  end
end