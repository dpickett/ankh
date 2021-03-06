module Ankh
  module Validations
    class HumanValidator
      def initialize(options = {})
        @options ||= options
      end
      
      def validate(record)
        if has_valid_answer?(record)
          record.errors.add(:human_answer, @options[:message] || "is not valid")
        end
        record.human_answer = ""
      end
      
      private
      def has_valid_answer?(record)
        record.salted_human_answer.present? && Ankh.encrypt(record.human_answer) != record.salted_human_answer
      end
    end
  end
end
