module Ankh
  module QuestionFactory
    class SimpleMath
      DIGIT_MAX = 10
      OPERATIONS = [
        "+",
        "-"
      ]

      def self.create
        @second_number = rand(DIGIT_MAX)
        @first_number = @second_number + rand(DIGIT_MAX)
        @operation = OPERATIONS[rand(OPERATIONS.size)]

        @question = "What is #{@first_number} #{@operation} #{@second_number}?"
        @answer = @first_number.send(@operation, @second_number).to_s
        Ankh::Question.new(@question, @answer)
      end
    end
  end
end

Ankh.register_factory(:simple_math, Ankh::QuestionFactory::SimpleMath)
