module Ankh
  module QuestionFactory
    #abstract class for identifying the item that comes before or after
    class ConstantSequence
      def self.create
        length = constant_collection.size
        anchor_index = random(length)
        anchor_constant = constant_collection[anchor_index]

        dir = direction
        @question = "What #{collection_name} comes #{dir} #{anchor_constant}?"
        @answer = send(dir, anchor_index)
        Ankh::Question.new(@question, @answer)
      end

      def self.constant_collection
        raise 'override this method'
      end

      protected
      def self.direction
        direction = random(2) == 1 ? 'before' : 'after'
      end

      def self.random(max)
        rand(max)
      end

      def self.collection_name
        raise 'override this method'
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



