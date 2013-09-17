# Version Number
require 'expects/version'
# Classes
require 'expects/error'
require 'expects/handler'

module Expects
  module ClassMethods
    def expects(subject, objects, message = nil)
      if objects.is_a? Regexp
        handler = Expects::Handlers::Regex.new(subject, objects, message)
      elsif objects.is_a? Proc
        handler = Expects::Handlers::Proc.new(subject, objects, message)
      else
        handler = Expects::Handler.new(subject, [*objects], message)
      end
      handler.accept!
    end
    
    def reject(subject, objects, message = nil)
      if objects.is_a? Regexp
        handler = Expects::Handlers::Regex.new(subject, objects)
      elsif objects.is_a? Proc
        handler = Expects::Handlers::Proc.new(subject, objects)
      else
        handler = Expects::Handler.new(subject, [*objects])
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
require 'expects/handlers/proc'
require 'expects/handlers/regex'