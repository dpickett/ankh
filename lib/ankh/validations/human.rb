module Ankh
  module Validations
    class HumanValidator
      def initialize(options = {})
        @options ||= options
      end

      def validate(record)
        if has_invalid_answer?(record)
          record.errors.add(:human_answer, @options[:message] || "is not valid")
        end
        record.human_answer = ""
      end

      private
      def has_invalid_answer?(record)
        record.salted_human_answer.present? && Ankh.encrypt(record.human_answer.try(:downcase)) != record.salted_human_answer
      end
    end

    module HelperMethods
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

