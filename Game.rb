# James Browning
# Joey De Lorenzo

# Game.rb

require "Room"
require "QuestObject"

class Game

	def initialize()
		puts "Welcome to the dungeon. You open the front door and enter the first room. In this room, you look around and see:"
		
		room1 = Room.new(rand(4))
		room1.buildRoom
	end
end
