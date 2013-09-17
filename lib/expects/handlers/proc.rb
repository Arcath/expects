module Expects
  module Handlers
    class Proc < Expects::Handler
      include Expects
      
      def initialize(subject, objects, message = nil)
        expects objects, ::Proc
        super
      end
      
      def valid?
        @objects.call(@subject)
      end
      
      def build_message
        return @message if @message
        return "Expected #{@subject.inspect} to get a true from the proc"
      end
    end
  end
end