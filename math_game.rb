# Add code for 2 player math game

require 'colorize'

@players = [
  { 
    name: "Player 1",
    lives: 3,
    score: 0
  },
  {
    name: "Player 2",
    lives: 3,
    score: 0
  }
]

@player1 = "Player 1"
@player2 = "Player 2"

@player1lives = 3
@player2lives = 3

@player1score = 0
@player2score = 0


# 1. Since you are not using classes, use hash for player
# 2. play should be on one player and have a player turn 
# 3. Outputs should be seperate from class
# 4. Think of each method as a black box and make sure it's testable on its own, it's not the case for play

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
  # display_question
  # question = "What is #{num1} #{action} #{num2}?"

  puts "Player 1 Turn: What is #{num1} #{action} #{num2}? >> "
  answer = gets.chomp.to_i

  if answer_correct?(question_inputs, answer)
    @player1score += 1
    puts "Correct! Player 1 Score = #{@player1score}; Player 2 Score = #{@player2score}".colorize(:green)
  else
    @player1lives -= 1
    puts "Incorrect! Player 1 Lives Left = #{@player1lives}; Player 2 Lives Left = #{@player2lives}".colorize(:red)
    return if @player1lives == 0 
  end

  p "-------------------------------------"
  # Player 2 Turn
  question_inputs = generate_question

  num1 = question_inputs[0]
  action = question_inputs[2]
  num2 = question_inputs[1]
  # question = "What is #{num1} #{action} #{num2}?"

  puts "Player 2 Turn: What is #{num1} #{action} #{num2}? >> "
  answer = gets.chomp.to_i

  if answer_correct?(question_inputs, answer)
    @player2score += 1
    puts "Correct! Player 1 Score = #{@player1score}; Player 2 Score = #{@player2score}".colorize(:green)
  else
    @player2lives -= 1
    puts "Incorrect! Player 1 Lives Left = #{@player1lives}; Player 2 Lives Left = #{@player2lives}".colorize(:red)
  end

end

def answer_correct?(inputs, answer_received)
  if inputs[2] == '+'
    correct_answer = inputs[0] + inputs[1]
    answer_received == correct_answer ? true : false
  end 
end

def winner
  if @player1score > @player2score
    winner = @player1
  else
    winner = @player2
  end
  "The winner was #{winner}! Player 1 Final Score = #{@player1score}; Player 2 Final Score = #{@player2score}"
end

# A method & call for running the game.

def run_game 
  while (@players[0] > 0) && (@player2lives > 0) do 
    play    
  end
  puts winner.colorize(:yellow) 
end

run_game

