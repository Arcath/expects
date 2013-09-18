require 'spec_helper'

describe Expects::Handlers::Regex do
  
  let(:user) do
    Class.new do
      include Expects
      
      def initialize(name, email)
        expects name, String
        expects email, /^.*\@.*$/
      end
      
      def not_email(email)
        reject email, /^.*\@.*$/
      end
    end
  end
  
  it "should only take a string and a regex pattern" do
    lambda { Expects::Handlers::Regex.new("foo", /foo/) }.should_not raise_exception
    lambda { Expects::Handlers::Regex.new(/foo/, "foo") }.should raise_exception
  end
  
  it "should let you pass regex to expects" do
    lambda { user.new("foo", "foo@bar.com") }.should_not raise_exception
  end
  
  it "should raise an exception if the subject doesn't match the supplied pattern" do
    lambda { user.new("foo", "foobar.com") }.should raise_exception
    begin
      user.new("foo", "foobar.com")
    rescue UnexpectedInput => e
      e.message.should eq "Expected \"foobar.com\" match \"/^.*\\\@.*$/\""
    end
  end
  
  it "should support reject aswell" do
    lambda { user.new("foo", "foo@bar.com").not_email("foo@bar.com") }.should raise_exception
  end
end