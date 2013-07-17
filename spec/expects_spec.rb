require 'spec_helper'

describe Expects do
  let(:test_class) do
    Class.new do
      include Expects
      
      def initialize(message)
        expects message, String
      end
    end
  end
  
  let(:array_class) do
    Class.new do
      include Expects
      
      def initialize(message)
        expects message, [String, Fixnum]
      end
    end
  end
  
  it "should include itself in any object" do
    lambda { test_class.new("Foo") }.should_not raise_exception
  end
  
  it "should stop you providing anything but an String" do
    lambda { test_class.new(1234) }.should raise_exception
  end
  
  it "should take an array" do
    array_class.new(1234)
  end
end