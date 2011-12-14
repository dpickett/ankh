module Ankh
  module Validations    
    module ActiveRecord
      def validates_human(options = {})
        self.send(:include, Ankh::Model) unless probably_included_already?
        validates_with HumanValidator, options
      end
  
      private
      def probably_included_already?
        self.respond_to?(:human_question) && self.respond_to?(:human_answer)
      end
    end
  end
end
