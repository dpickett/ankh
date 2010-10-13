module Ankh
  module Validations
    class HumanValidator
      def initialize(options = {})
        
      end
      
      def validate(record)
        
      end
    end
    
    module HelperMethods
      def validates_human(options = {})
        self.send(:include, Ankh::Model)
        validates_with HumanValidator, options
      end
    end
  end
end
