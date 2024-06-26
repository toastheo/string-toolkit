# How to use the gem

## randomize(length, options)
Returns a string of random characters.

**Parameters**

- `length`: Optional. The length of the random string to generate. Default is 8 characters.
- `options`: Optional. A hash to specify which types of characters to include or exclude:
    - `digits`: Include digits(0-9).
    - `lower_case`: Include lowercase letters (a-z)
    - `upper_case`: Include uppercase letters (A-Z)
    - `special_chars`: Include special characters(!@#$%^&*)

**Example**

```ruby
String.randomize()                                                                  # => "U!iAIWUn"
String.randomize(20)                                                                # => "JRk#m#%ac@3wWi3@gG&O"
String.randomize(15, { digits: false, lower_case: false, special_chars: false })    # => "QWRNNYMHZVGLWTG"
```

---

## capitalize_each_word
Capitalizes each word in a string.

**Example**

```ruby
"good morning, you're beautiful!".capitalize_each_word    # => "Good Morning, You're Beautiful!"
```

---

## numeric?
Checks whether a string contains only numeric characters.

**Example**

```ruby
"123.456".numeric?    # => true
"123Abc".numeric?     # => false
```

---

## palindrome?
Checks whether a character string represents a palindrome.

**Example**

```ruby
"A man, a plan, a canal, Panama".palindrome?    # => true
"This is not a palindrome".palindrome?          # => false
```

---

## remove_whitespace
Removes all whitespaces.

**Example**

```ruby
"  Hello\t\tWorld\n\n\r  ".remove_whitespace    # => "HelloWorld"
```

---

## to_phone(country_code)
Converts a character string containing a phone number into the phone format corresponding to the transferred country code.
(Throws an exception if the phone number or the country code is invalid.)

**Parameters**

- `country_code`: The country code to be used.

**Example**

```ruby
"2025550125".to_phone("US")    # => +1 202-555-0125
"030123456".to_phone("DE")     # => +49 30 123456
```

---

## to_slug(seperator)
Creates a slug from the current string.

**Parameters**

- `seperator`: Optional. The selected separator. Can also be a string of any characters.

**Example**

```ruby
"Hello person, how was your day?".to_slug          # => "hello-person-how-was-your-day"
"Hello person, how was your day?".to_slug("==")    # => "hello==person==how==was==your==day"
```

---

## extract_emails
Extracts all e-mail addresses from a string.

**Example**

```ruby
"Contact us at example@example.com or Support@FOO.com".extract_emails  # => ["example@example.com", "support@foo.com"]
```

---

## obfuscate(start: , finish: , char: , strict:) 
Hides parts of a string by replacing alphanumeric characters with a specified character.

**Parameters**

- `start`: The start index from which characters in the string are to be replaced.
- `finish`: The end index up to which characters in the string are to be replaced.
- `char`: Optional. The character used for the replacement. The asterisk (*) is used by default.
- `strict`: Optional. If strict is set to true, all characters are hidden and not just alphanumeric characters.

**Example**

```ruby
"1234-5678-Abcd-1121".obfuscate(start: 4, end: 14)                      # => "1234-****-****-1121"
"1234-5678-Abcd-1121".obfuscate(start: 4, end: 14, char: '#')           # => "1234-####-####-1121"
"1234-5678-Abcd-1121".obfuscate(start: 4, finish: 14, strict: true)     # => "1234***********1121"
```

---

## word_count(ignore_case:, only:)
Counts the words in a string.

**Parameters**

- `ignore_case`: Does not differentiate between upper and lower case when counting.
- `only`: Counts only the specified words.

**Example**

```ruby
"Hello world! This is great.".word_count                            # => 5
"Hello hello HELLO".word_count(ignore_case: true)                   # => 1
"Hello world! This is great.".word_count(only: %w[Hello world])     # => 2
"Hello hello HELLO".word_count(ignore_case: true, only: "Hello")    # => 3      
```

---

## to_boolean
Converts common string representations of truth values to a real Boolean value.

**Example**

*Here are just a few examples. If you are interested in the complete list and/or would like to extend it, then take a look at config/booleans.yml.*

```ruby
"Y".to_boolean      # => true
"YES".to_boolean    # => true
"TRUE".to_boolean   # => true

"N".to_boolean      # => false
"NO".to_boolean     # => false
"FALSE".to_boolean  # => false
```

---

## to_currency
Converts a character string containing a float value into the currency format corresponding to the transferred ISO code.

**Parameters**

- `currency code`: The currency code according to ISO standart.

**Example**

```ruby
"-12345678.90".to_currency("USD")    # => -$12,345,678.90
"1234.56".to_currency("Db")          # => 1,234.56 Db
```
