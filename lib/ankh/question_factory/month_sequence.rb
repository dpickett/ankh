module Ankh
  module QuestionFactory
    class MonthSequence < Ankh::QuestionFactory::ConstantSequence
      def self.constant_collection
        Date::MONTHNAMES.reject{|i| i.nil?}
      end

      protected
      def self.collection_name
        "month"
      end
    end
  end
end

Ankh.register_factory(:month_sequence, Ankh::QuestionFactory::MonthSequence)

