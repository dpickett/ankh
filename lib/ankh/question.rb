module Ankh
  class Question
    OPERATIONS = [
      "+",
      "-"
    ]
    
    attr_reader :first_number, :second_number, :operation, :question, :answer
    
    def initialize
      @second_number = rand(9)
      @first_number = @second_number + rand(9)
      @operation = OPERATIONS[rand(2)]
      
      @question = "What is #{first_number} #{operation} #{second_number}?"
      @answer = @first_number.send(@operation, @second_number)
    end
    
    def self.generate
      new
    end
  end
end
