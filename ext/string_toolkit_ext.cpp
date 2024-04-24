#include "ruby.h"
#include <phonenumbers/phonenumberutil.h>
#include <phonenumbers/phonenumber.pb.h>

using namespace i18n::phonenumbers;

std::string handleError(const PhoneNumberUtil::ErrorType&);

static VALUE to_phone(VALUE self, VALUE country_code) {
  if (TYPE(country_code) != T_STRING) {
    rb_raise(rb_eArgError, "country_code has to be a string");
  }

  char* country = StringValueCStr(country_code);
  std::string country_str(country);
  
  char* input = StringValueCStr(self);
  std::string raw_input(input);

  PhoneNumber phone_number;
  PhoneNumberUtil* phone_util = PhoneNumberUtil::GetInstance();

  PhoneNumberUtil::ErrorType error = phone_util->Parse(raw_input, country_str, &phone_number);

  if (error == PhoneNumberUtil::NO_PARSING_ERROR && phone_util->IsValidNumber(phone_number)) {
    std::string formatted_output;
    phone_util->Format(phone_number, PhoneNumberUtil::INTERNATIONAL, &formatted_output);
    return rb_str_new_cstr(formatted_output.c_str());
  } else {
    rb_raise(rb_eStandardError, "%s", handleError(error).c_str());
  }
}

extern "C" void Init_string_toolkit_ext() {
  rb_define_method(rb_cString, "to_phone", RUBY_METHOD_FUNC(to_phone), 1);
}

// ERROR HANDLING
std::string handleError(const PhoneNumberUtil::ErrorType& error) {
  std::string error_message = "Error parsing the phone number: ";
  switch (error) {
    case PhoneNumberUtil::INVALID_COUNTRY_CODE_ERROR:
      error_message += "Invalid country code";
      break;
    case PhoneNumberUtil::NOT_A_NUMBER:
      error_message += "String is not a number";
      break;
    case PhoneNumberUtil::TOO_LONG:
      error_message += "Phone number is too long";
      break;
    case PhoneNumberUtil::INVALID_NUMBER:
      error_message += "Phone number is invalid";
      break;
    default:
      error_message += "Unkown error occured: " + error;
  }

  return error_message;
}