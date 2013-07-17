# Version Number
require 'expects/version'
# Error
require 'expects/error'

module Expects
  private
  
  def expects(subject, object)
    raise UnexpectedInput.new("Expected #{object.inspect}", subject, object) unless subject.is_a? object
  end
end
