module Ankh
  module QuestionFactory
    class MonthSequence
      def self.create
        length = constant_collection.size
        anchor_index = random(length)
        anchor_constant = constant_collection[anchor_index]

        @question = "What #{collection_name} comes #{direction} #{anchor_constant}?"
        @answer = send(direction, anchor_index)
        Ankh::Question.new(@question, @answer)
      end

      def self.constant_collection
        Date::MONTHNAMES.reject{|i| i.nil?}
      end

      protected
      def self.direction
        direction = random(2) == 1 ? 'before' : 'after'
      end

      def self.random(max)
        rand(max)
      end

      def self.collection_name
        "month"
      end

      def self.before(index)
        if index == 0
          constant_collection[constant_collection.size - 1]
        else
          constant_collection[index - 1]
        end
      end

      def self.after(index)
        if index + 1 == constant_collection.size
          constant_collection[0]
        else
          constant_collection[index + 1]
        end
      end
    end
  end
end

Ankh.register_factory(:month_sequence, Ankh::QuestionFactory::MonthSequence)

