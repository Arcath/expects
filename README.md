# Expects

A DSL for validating input for methods

[![Coverage Status](https://coveralls.io/repos/Arcath/expects/badge.png?branch=master)](https://coveralls.io/r/Arcath/expects?branch=master) [![Build Status](https://travis-ci.org/Arcath/expects.png?branch=master)](https://travis-ci.org/Arcath/expects) [![Code Climate](https://codeclimate.com/github/Arcath/expects.png)](https://codeclimate.com/github/Arcath/expects)

## Installation

Add this line to your application's Gemfile:

    gem 'expects'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install expects

## Usage

Include `Expects` in your class and then call it in your methods eg:

```ruby
class YourClass
  include Expects
  
  def initialize(name)
    expects name, String
  end
end
```
You can pass an array instead of one class to accept multiple types e.g.

```ruby
expects number, [Fixnum, Float]
```

If you try to pass anything other than a string to YourClass.new expects will raise an exception which you can catch like so:

```ruby
begin
  YourClass.new(1234)
rescue UnexpectedInput => e
  e.message # Expected 1234 to be String
  e.subject # 1234
  e.expected # [String]
end
```

All exceptions thrown by expects are instances of `UnexpectedInput`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
