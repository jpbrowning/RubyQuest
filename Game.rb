# @author Joey De Lorenzo
# @author James Browning

# Game.rb
# This holds the instance of a game.

require "Floor"

class Game
	def initialize
		@floor_arr = Array.new(3) { Floor.new(3) }
	end

	def startGame()
		floor = @floor_arr.shift
		floor.buildFloor(@floor_arr)
		floor.start()
	end
end
