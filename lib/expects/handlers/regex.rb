module Expects
  module Handlers
    class Regex < Expects::Handler
      include Expects
      
      def initialize(subject, objects, message = nil)
        expects subject, String
        expects objects, Regexp
        super
      end
      
      def valid?
        @subject.match(@objects)
      end
      
      def build_message
        return @message if @message
        return "Expected #{@subject.inspect} match \"#{@objects.inspect}\""
      end
    end
  end
end