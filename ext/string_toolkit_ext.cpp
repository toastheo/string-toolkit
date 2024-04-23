#include "ruby.h"
#include <phonenumbers/phonenumberutil.h>
#include <phonenumbers/phonenumber.pb.h>

using namespace i18n::phonenumbers;

static VALUE method_to_phone(int argc, VALUE* argv, VALUE self) {
  VALUE rb_str, rb_country_code;
  rb_scan_args(argc, argv, "11", &rb_str, &rb_country_code);

  char* input = StringValueCStr(rb_str);    // convert ruby string into c string
  const char* country_code = NIL_P(rb_country_code) ? "ZZ" : StringValueCStr(rb_country_code);
  std::string phoneNumber(input);

  PhoneNumberUtil* phoneUtil = PhoneNumberUtil::GetInstance();
  PhoneNumber phone_number;
  PhoneNumberUtil::ErrorType error;

  error = phoneUtil->Parse(phoneNumber, "ZZ", &phone_number);
  if (error != PhoneNumberUtil::NO_PARSING_ERROR) {
    error = phoneUtil->Parse(phoneNumber, country_code, &phone_number);
  }

  if (error == PhoneNumberUtil::NO_PARSING_ERROR) {
    std::string formatted_number;
    phoneUtil->Format(phone_number, PhoneNumberUtil::INTERNATIONAL, &formatted_number);
    return rb_str_new_cstr(formatted_number.c_str());
  } else {
    return Qnil;
  }
}

extern "C" void Init_string_toolkit_ext() {
  rb_define_method(rb_cString, "to_phone", reinterpret_cast<VALUE(*)(...)>(method_to_phone), -1);
}