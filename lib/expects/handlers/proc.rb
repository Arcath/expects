module Expects
  module Handlers
    class Proc < Expects::Handler
      include Expects
      
      def initialize(subject, objects)
        expects objects, ::Proc
        super
      end
      
      def valid?
        @objects.call(@subject)
      end
      
      def build_message
        "Expected #{@subject.inspect} to get a true from the proc"
      end
    end
  end
end