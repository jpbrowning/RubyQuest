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
		@floor_arr[0].buildFloor()
		@floor_arr[0].start()
	end
end
