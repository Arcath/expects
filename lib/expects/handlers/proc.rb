module Expects
  module Handlers
    class Proc < Expects::Handler
      include Expects
      
      def initialize(subject, objects, message = nil)
        expects objects, ::Proc
        @message = (message || "Expected #{subject.inspect} to get a true from the proc")
        super
      end
      
      def valid?
        @objects.call(@subject)
      end
    end
  end
end