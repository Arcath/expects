module Expects
  class Handler
    attr_reader :subject, :objects
    
    def initialize(subject, objects, message = nil)
      @subject = subject
      @objects = objects
      @message = message
    end
    
    def valid?
      @objects.include? @subject.class
    end
    
    def accept!
      raise UnexpectedInput.new(self) unless valid?
    end
    
    def reject!
      raise UnexpectedInput.new(self) if valid?
    end
    
    def build_message
      return @message if @message
      return "Expected #{@subject.inspect} to be #{@objects.join(", ")}"
    end
  end
end