#Code to run the Math Game

require './player.rb'
require './functions.rb'

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