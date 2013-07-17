# Version Number
require 'expects/version'
# Error
require 'expects/error'

module Expects
  private
  
  def expects(subject, objects)
    objects = [objects] unless objects.is_a? Array
    raise UnexpectedInput.new("Expected #{objects.join(" or ")}", subject, objects) unless objects.include? subject.class
  end
end
