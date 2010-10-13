module Ankh
  module Validations
    class HumanValidator
      def initialize(options = {})
        @options ||= options
      end
      
      def validate(record)
        if record.salted_human_answer.present? && Ankh.encrypt(record.human_answer) != record.salted_human_answer
          record.errors.add(:human_answer, @options[:message] || "is not valid")
        end
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
