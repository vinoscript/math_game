# Adding a seperate class for questions.

class Question
# this is where attr.accessor would go but not required for this class.
  
  def initialize(num1, num2, action)
    @num1 = num1
    @num2 = num2
    @action = action
  end

  #returns a new question by calling Question.new
  def self.create
    num1 = rand(1..20)
    num2 = rand(1..20)
    action = ['+', '-', '*'].sample
    Question.new(num1, num2, action)  
  end

  def display_question
    puts "What is #{@num1} #{@action} #{@num2}?"
  end

  def correct_answer
    case @action
    when "+"
      @num1 + @num2
    when "-"
      @num1 - @num2
    when "*"
      @num1 * @num2
    end
  end

  def display_correct_answer
    puts "The correct answer was #{correct_answer}"
  end

end


puts new_question = Question.create 
new_question.display_question
# puts new_question.correct_answer
new_question.display_correct_answer