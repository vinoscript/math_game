require 'colorize'

class Player

  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def gain_point
    @score += 1
  end

  def lose_a_life
    @lives -= 1
  end

  def display_stats
    puts "Score for #{@name} = #{@score}".colorize(:blue)
    puts "Lives remaining for #{@name} = #{@lives}".colorize(:blue)
  end

end



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

# def play_again?
#   puts "Would you like to play again? (yes/no) >> "
#   gets.chomp.to_s.downcase == 'yes'
# end

#Put code into action:

get_users

@player1 = Player.new(@user1)
@player2 = Player.new(@user2)

keep_playing = true

while keep_playing do
  break if keep_playing == false
  while (@player1.lives > 0) && (@player2.lives > 0) do

    @current_player = @player1
    play(@current_player)
    display_all
    break if @current_player.lives == 0

    @current_player = @player2
    play(@current_player)
    display_all

  end

  display_winner(pick_winner)

  puts "Would you like to play again? (yes/no) >> "

  if gets.chomp.to_s.downcase == 'no'
    keep_playing = false
  else
    @player1.lives = 3
    @player2.lives = 3
    @player1.score = 0
    @player2.score = 0
  end

end










