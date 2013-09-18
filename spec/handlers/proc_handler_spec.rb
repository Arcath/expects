require 'spec_helper'

describe Expects::Handlers::Proc do
  
  let(:test_class) do
    Class.new do
      include Expects
      
      def initialize(array)
        expects array, Proc.new(){ |array| array.length >= 3 }
      end
      
      def not_good(array)
        reject array, Proc.new(){ |array| array.length >= 3 }
      end
    end
  end
  
  let(:fail_array) do
    [1,2]
  end
  
  let(:pass_array) do
    [1,2,3,4,5]
  end
  
  let(:working_instance) do
    test_class.new(pass_array)
  end
  
  it "should take a proc" do
    lambda { test_class.new(pass_array) }.should_not raise_exception
  end
  
  it "should raise an error if the proc returns false" do
    lambda { test_class.new(fail_array) }.should raise_exception UnexpectedInput
    begin
      test_class.new(fail_array)
    rescue UnexpectedInput => e
      e.message.should eq "Expected [1, 2] to get a true from the proc"
    end
  end
  
  it "should support rejection" do
    lambda { working_instance.not_good(pass_array) }.should raise_exception UnexpectedInput
  end
end