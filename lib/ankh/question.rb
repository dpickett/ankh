module Ankh
  class Question
    attr_reader :question, :answer

    def initialize(question, answer)
      @question = question
      @answer = answer
    end

    def self.generate
      factory.create
    end

    protected
    def self.factory
      Ankh.random_factory
    end
  end
end

