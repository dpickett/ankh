module Ankh
  module QuestionFactory
    class DaySequence < Ankh::QuestionFactory::ConstantSequence
      def self.constant_collection
        Date::DAYNAMES.reject{|i| i.nil?}
      end

      protected
      def self.collection_name
        "day"
      end

    end
  end
end

Ankh.register_factory(:day_sequence, Ankh::QuestionFactory::DaySequence)

