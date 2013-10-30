# @author Joey De Lorenzo
# @author James Browning

# Game.rb
# This holds the instance of a game.

require "Floor"
require "Player"

class Game
	def initialize
		puts `clear`
		width = `/usr/bin/env tput cols`.to_i
		
		printf("What is your name? ")
		@name = gets.chomp
		@player = Player.new(@name)
		
		puts `clear`
		
		puts "\nWelcome to Ruby Quest, %s.\n\n\n".center(width) % @player.getName()
		
		puts "\tAfter what must have been days, you finally wake up"
		puts "\tonly to find yourself in front of an old, rotting door.\n\n"
		puts "\tYou slowly open the door, and step forward...\n\n"
		puts "[PRESS ANY KEY]".center(width)
		system("stty raw -echo")
  		STDIN.getc
  		system("stty -raw echo")
		@floor_arr = Array.new(3) { Floor.new(3) }
	end

	def startGame()
		floor = @floor_arr.shift
		floor.buildFloor(@floor_arr)
		floor.start(@player)
	end
end
