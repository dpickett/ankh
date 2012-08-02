module Ankh
  module Model
    def self.included(base)
      base.send(:attr_accessor, :human_answer)
      base.send(:attr_reader, :human_question)
      base.send(:attr_accessor, :salted_human_answer)
    end

    def generate_human_question
      question = Ankh::Question.generate
      @human_question = question.question
      self.salted_human_answer = Ankh.encrypt(question.answer)
    end
  end
end

ActiveRecord::Base.extend(Ankh::Validations::HelperMethods)

