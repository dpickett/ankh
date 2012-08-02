require "spec_helper"

describe Ankh::Model do
  INVALID_ANSWER = "3241235" #this answer will never be valid due to constraints
  class Post < ActiveRecord::Base
    validates_human
    attr_accessor :name
    validates_presence_of :name
  end

  subject do
    p = Post.new
    p.name = "John"
    p.generate_human_question
    p
  end

  describe "generation" do
    its(:human_question){ should_not be_nil }
    its(:human_answer){ should be_blank }

    it "should have a salted human answer" do
      subject.salted_human_answer.should_not be_blank
    end
  end

  it "should not save if I do not specify a human answer" do
    subject.human_answer = ""
    subject.save.should be_false
    subject.errors[:human_answer].should_not be_nil
  end

  it "should clear out the human answer if validation fails" do
    subject.human_answer = INVALID_ANSWER
    subject.save.should be_false
    subject.human_answer.should be_blank
  end

  it "should not save if I do not match the intended answer" do
    subject.human_answer = INVALID_ANSWER
    subject.save.should be_false
    subject.errors[:human_answer].should_not be_nil
  end

  it "should save if I match the intended answer" do
    question = Ankh::Question.new
    Ankh::Question.expects(:generate).returns(question)

    subject.human_answer = question.answer
    subject.save.should be_true
  end

  it "should clear the human answer if the model is not valid" do
    question = Ankh::Question.new
    Ankh::Question.expects(:generate).returns(question)
    subject.name = nil
    subject.human_answer = question.answer
    subject.save.should be_false
    subject.human_answer.should be_blank
  end
end

