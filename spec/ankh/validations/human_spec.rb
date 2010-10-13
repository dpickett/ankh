require 'spec_helper'

describe "ankh human validations" do
  class Post < ActiveRecord::Base
    validates_human
  end
  
  it 'should not save if I do not specify a human answer' do
    p = Post.new(:human_answer => "")
    p.save.should be_false
    p.errors[:human_answer].should_not be_nil
  end
end