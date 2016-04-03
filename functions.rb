# Functions related to playing the game

def generate_question_inputs
  num1 = rand(1..20)
  num2 = rand(1..20)
  action = '+'
  [num1, num2, action]
end

def new_question
  @question_inputs = generate_question_inputs

  num1 = @question_inputs[0]
  action = @question_inputs[2]
  num2 = @question_inputs[1]
  "#{@current_player.name}'s Turn: What is #{num1} #{action} #{num2}? >> "
end

def get_answer
  gets.chomp.to_i
end

def answer_correct?(inputs, answer_received)
  if inputs[2] == '+'
    correct_answer = inputs[0] + inputs[1]
    answer_received == correct_answer
  end 
end

def pick_winner
  if @player1.lives.to_i == 0
    return @player2.name
  else
    return @player1.name
  end
end

def display_winner(winner_name)
  puts "The winner is... #{winner_name}!!!"
end

def display_correct
  puts "Correct! Gain a point".colorize(:green)
end

def display_incorrect
  puts "That is not correct! Lose a life".colorize(:red)
end

def display_all
  puts "******************************************"
  @player1.display_stats
  @player2.display_stats
  puts "******************************************"
end

def play(player)
  puts new_question
  if answer_correct?(@question_inputs, get_answer)
    player.gain_point
    display_correct
  else
    player.lose_a_life
    display_incorrect
  end

end

def get_users
  puts "Please enter Player 1 Name >> "
  @user1 = gets.chomp.to_s
  puts "Please enter Player 2 Name >> "
  @user2 = gets.chomp.to_s
end


