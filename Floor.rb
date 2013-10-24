# @author Joey De Lorenzo
# @author Trey Browning

# Floor.rb

# This class handles a floor of our text adventure game
# Each floor will contain a rando numba of floors.


require "Room"
require "QuestObject"


class Floor
        attr_accessor :room_arr
        attr_accessor :num_of_rooms

        def initialize( x )
                $num_of_rooms = x
                $room_arr = Array.new
        end

        def buildFloor( )
                i = 0;
                while i < $num_of_rooms
                        thisRoom = Room.new(1)
                        thisRoom.buildRoom
                        $room_arr << thisRoom
                        i = i + 1;
                end
        end
end
