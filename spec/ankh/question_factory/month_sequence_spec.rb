require 'spec_helper'

describe Ankh::QuestionFactory::MonthSequence do
  let(:factory) { Ankh::QuestionFactory::MonthSequence }
  it 'suggests a month before for every month' do
    factory.stubs(:direction).returns('before')
    (0..11).to_a.each do  |index|
      factory.stubs(:random).returns(index)
      question = factory.create
      question.question.should include(factory.constant_collection[index])
    end
  end

  it 'suggests a month after every month' do
    factory.stubs(:direction).returns('after')
    (0..11).to_a.each do  |index|
      factory.stubs(:random).returns(index)
      factory.create.question.should include(factory.constant_collection[index])
    end
  end
end

