module Expects
  module Handlers
    class Regex < Expects::Handler
      include Expects
      
      def initialize(subject, objects, message = nil)
        expects subject, String
        expects objects, Regexp
        @message = (message || "Expected #{subject.inspect} match \"#{objects.inspect}\"" )
        super
      end
      
      def valid?
        @subject.match(@objects)
      end
    end
  end
end