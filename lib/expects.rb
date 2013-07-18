# Version Number
require 'expects/version'
# Error
require 'expects/error'

module Expects
  module ClassMethods
    def expects(subject, objects)
      objects = [objects] unless objects.is_a? Array
      raise UnexpectedInput.new(subject, objects) unless objects.include? subject.class
    end
    
    def reject(subject, objects)
      objects = [objects] unless objects.is_a? Array
      raise UnexpectedInput.new(subject, objects) if objects.include? subject.class
    end
  end
  
  def self.included(klass)
    klass.extend ClassMethods
  end
  
  def expects(*args)
    self.class.expects(*args)
  end
  
  def reject(*args)
    self.class.reject(*args)
  end
  
  private :expects, :reject
end
