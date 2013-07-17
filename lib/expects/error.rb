class UnexpectedInput < StandardError
  attr_reader :message, :subject, :expected
  
  def initialize(message = nil, subject = nil, expected = nil)
    @message, @subject, @expected = message, subject, expected
  end
end