class UnexpectedInput < StandardError
  attr_reader :subject, :expected
  
  def initialize(subject = nil, expected = nil)
    @subject, @expected = subject, expected
  end
  
  def message
    @message ||= build_message
  end
  
  def build_message
    "Expected #{@subject.inspect} to be #{expected.join(", ")}"
  end
end
