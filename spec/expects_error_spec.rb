require 'spec_helper'

describe UnexpectedInput do
  let(:error) do
    UnexpectedInput.new(1234, [String])
  end
  
  let(:test_class) do
    Class.new do
      include Expects
      
      def initialize(message)
        expects message, String
      end
    end
  end
  
  it "should take a few options" do
    begin
      raise error
    rescue UnexpectedInput => e
      e.message.should eq "Expected 1234 to be String"
      e.subject.should eq 1234
      e.expected.should eq [String]
    end
  end
  
  it "should throw the error correctly" do
    begin
      test_class.new(1234)
    rescue UnexpectedInput => e
      e.message.should eq error.message
      e.subject.should eq error.subject
      e.expected.should eq error.expected
    end
  end
end
