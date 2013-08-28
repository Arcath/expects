# Version Number
require 'expects/version'
# Classes
require 'expects/error'
require 'expects/handler'

module Expects
  module ClassMethods
    def expects(subject, objects)
      objects = [objects] unless objects.is_a? Array
      Expects::Handler.new(subject, objects).accept!
    end
    
    def reject(subject, objects)
      objects = [objects] unless objects.is_a? Array
      Expects::Handler.new(subject, objects).reject!
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
