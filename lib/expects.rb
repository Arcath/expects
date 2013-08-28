# Version Number
require 'expects/version'
# Classes
require 'expects/error'
require 'expects/handler'

module Expects
  module ClassMethods
    def expects(subject, objects)
      if objects.is_a? Regexp
        handler = Expects::Handlers::Regex.new(subject, objects)
      else
        objects = [objects] if objects.is_a? Class
        handler = Expects::Handler.new(subject, objects)
      end
      handler.accept!
    end
    
    def reject(subject, objects)
      if objects.is_a? Regexp
        handler = Expects::Handlers::Regex.new(subject, objects)
      else
        objects = [objects] if objects.is_a? Class
        handler = Expects::Handler.new(subject, objects)
      end
      handler.reject!
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

# Handlers
require 'expects/handlers/regex'