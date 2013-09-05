class UnexpectedInput < StandardError
  attr_reader :subject, :expected
  
  def initialize(handler)
    @handler = handler
    @subject, @expected = handler.subject, handler.objects
  end
  
  def message
    @message ||= @handler.build_message
  end
end
