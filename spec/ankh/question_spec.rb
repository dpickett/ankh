require "spec_helper"

describe Ankh::Question do
  subject { Ankh::Question.generate }

  its(:question){ should_not be_nil }
  its(:answer){ should_not be_nil }
end

