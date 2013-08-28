module Expects
  module Handlers
    class Regex < Expects::Handler
      include Expects
      
      def initialize(subject, objects)
        expects subject, String
        expects objects, Regexp
        super
      end
      
      def valid?
        @subject.match(@objects)
      end
    end
  end
end