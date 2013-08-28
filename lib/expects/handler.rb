module Expects
  class Handler
    def initialize(subject, objects)
      @subject = subject
      @objects = objects
    end
    
    def valid?
      @objects.include? @subject.class
    end
    
    def accept!
      raise UnexpectedInput.new(@subject, @objects) unless valid?
    end
    
    def reject!
      raise UnexpectedInput.new(@subject, @objects) if valid?
    end
  end
end