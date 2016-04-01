# Add code for 2 player math game

@player1 = "Player 1"
@player2 = "Player 2"

@player1lives = 3
@player2lives = 3

@player1score = 0
@player2score = 0


def generate_question
  num1 = rand(1..20)
  num2 = rand(1..20)
  action = '+'
  [num1, num2, action]
end

def play
  # Player 1 Turn
  p "-------------------------------------"
  question_inputs = generate_question

  num1 = question_inputs[0]
  action = question_inputs[2]
  num2 = question_inputs[1]
  question = "What is #{num1} #{action} #{num2}?"

  puts "Player 1 Turn: What is #{num1} #{action} #{num2}? >> "
  answer = gets.chomp.to_i

  if answer_correct?(question_inputs, answer)
    @player1score += 1
    puts "Correct! Player 1 Score = #{@player1score}; Player 2 Score = #{@player2score}"
  else
    @player1lives -= 1
    puts "Incorrect! Player 1 Lives Left = #{@player1lives}; Player 2 Lives Left = #{@player2lives}"
    return if @player1lives == 0 
  end

  p "-------------------------------------"
  # Player 2 Turn
  question_inputs = generate_question

  num1 = question_inputs[0]
  action = question_inputs[2]
  num2 = question_inputs[1]
  question = "What is #{num1} #{action} #{num2}?"

  puts "Player 2 Turn: What is #{num1} #{action} #{num2}? >> "
  answer = gets.chomp.to_i

  if answer_correct?(question_inputs, answer)
    @player2score += 1
    puts "Correct! Player 1 Score = #{@player1score}; Player 2 Score = #{@player2score}"
  else
    @player2lives -= 1
    puts "Incorrect! Player 1 Lives Left = #{@player1lives}; Player 2 Lives Left = #{@player2lives}"
  end

end

def answer_correct?(inputs, answer_received)
  if inputs[2] == '+'
    correct_answer = inputs[0] + inputs[1]
    if answer_received == correct_answer
      true
    else
      false
    end
  end 
end


def run_game 
  
  while (@player1lives > 0) && (@player2lives > 0) do 
    play    
  end

  if @player1score > @player2score
    winner = @player1
  else
    winner = @player2
  end

  puts "The winner was #{winner}! Player 1 Final Score = #{@player1score}; Player 2 Final Score = #{@player2score}"

end

run_game

