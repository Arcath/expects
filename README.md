# Expects

A DSL for defining input expectations for methods

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
