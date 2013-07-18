# Version Number
require 'expects/version'
# Error
require 'expects/error'

module Expects
  def expects(subject, objects)
    objects = [objects] unless objects.is_a? Array
    raise UnexpectedInput.new(subject, objects) unless objects.include? subject.class
  end
  
  def reject(subject, objects)
    objects = [objects] unless objects.is_a? Array
    raise UnexpectedInput.new(subject, objects) if objects.include? subject.class
  end
  
  private :expects
end
