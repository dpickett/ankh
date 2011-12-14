module Ankh
  module Model
    def validates_human(options = {})
      include Ankh::Model::HelperMethods
      validates_with Ankh::Validations::HumanValidator, options
    end

    module HelperMethods
      extend ActiveSupport::Concern

      included do
        attr_accessor :human_answer
        attr_accessor :human_question
        attr_accessor :salted_human_answer
      end
   
      def generate_human_question
        question = Ankh::Question.generate
        @human_question = question.question
        self.salted_human_answer = Ankh.encrypt(question.answer)
      end
    end
  end
end

