require "spec_helper"

describe Ankh::Model do
  class Post < ActiveRecord::Base
    validates_human
  end
  
  subject {  Post.new(:human_answer => "", :salted_human_answer => "234123412512") }
  
  it "should not save if I do not specify a human answer" do
    subject.save.should be_false
    subject.errors[:human_answer].should_not be_nil
  end
  
  describe "generation" do
    subject do 
      p = Post.new
      p.generate_human_question
      p
    end
    
    its(:human_question){ should_not be_nil }
    its(:human_answer){ should_not be_nil }
    
    it "should have a salted human answer that equals the encrypted version of the answer" do
      subject.salted_human_answer.should eql(Ankh.encrypt(subject.human_answer))
    end
  end
end