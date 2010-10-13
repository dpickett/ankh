require "spec_helper"

describe Ankh::Question do
  subject { Ankh::Question.generate }
  
  its(:question){ should_not be_nil }
  its(:answer){ should_not be_nil }
  
  it "should have a valid operation" do
    Ankh::Question::OPERATIONS.should include(subject.operation)
  end
  
  it "should have a first number less than 20" do
    subject.first_number.should < 20
  end
  
  it "should have a second number less than 10" do
    subject.second_number.should < 10
  end
  
  describe "the question" do
    it "should contain the first number" do
      subject.question.should =~ /#{subject.first_number}/
    end
    
    it "should contain the second number" do
      subject.question.should =~ /#{subject.second_number}/
    end
    
    it "should contain the operation" do
      subject.question.should =~ /#{Regexp.escape(subject.operation)}/
    end
  end
  
  describe "the answer" do
    it "should perform the operation on the two numbers" do
      subject.answer.should eql(subject.first_number.send(subject.operation, subject.second_number))
    end
  end
end