#The Player Class

require 'colorize'
require './functions.rb'

class Player

  attr_accessor :name, :lives, :score

  @@players_all = []

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
    @@players_all = name
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


