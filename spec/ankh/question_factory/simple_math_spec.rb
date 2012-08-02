require 'spec_helper'
require 'rubygems'
require 'pry'

describe Ankh::QuestionFactory::SimpleMath do
  let(:factory) { Ankh::QuestionFactory::SimpleMath }
  it 'registers with ankh' do
    Ankh.available_factories.keys.should include(:simple_math)
  end

  it 'creates a question with a mathematical equation in it' do
    question = factory.create
    question.question.should match(/\+|\-/)
  end

  it 'has an answer that is the operations result' do
    question = factory.create
    matches = question.question.match(/(\d+) (\+|\-) (\d+)/)
    answer = matches[1].to_i.send(matches[2], matches[3].to_i).to_s
    question.answer.should eql(answer)
  end
end

