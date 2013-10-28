# @author Joey De Lorenzo
# @author Trey Browning

# Floor.rb

# This class handles a floor of our text adventure game
# Each floor will contain a rando number of floors.


require "Room"
require "QuestObject"


class Floor
	attr_accessor :room_arr
	attr_accessor :num_of_rooms

	def initialize( x )
		$num_of_rooms = x		
		$room_arr = Array.new(x) { Room.new(rand(3)) }
	end

	def buildFloor( )
		i = 1;
		puts $num_of_rooms
		$room_arr[0].buildRoom(nil, $room_arr[1])
		while i < $num_of_rooms.to_i-1
			$room_arr[i].buildRoom($room_arr[i-1], $room_arr[i+1])
			i = i + 1;
		end
		$room_arr[i].buildRoom($room_arr[1], nil)
		
	end
	
	def start()
		$room_arr[0].enter()
	end
end
