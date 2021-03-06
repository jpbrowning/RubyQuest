# James Browning
# Joey DeLorenzo

# Floor.rb

# This class handles a floor of our text adventure game
# Each floor will contain a random number of floors.

require "Room"

class Floor

   # Initializes the Floor, with a random number of Rooms.
   def initialize()
      # Between 2 and 7 rooms in a floor.
      x = 2 + rand(5)
      @room_arr = Array.new(x)
      @num_of_rooms = x
      j = 0
      while j < x
         @room_arr[j] = Room.new(rand(3))
         j = j + 1
      end		
   end

   # Builds the floor, and passes the other floors to the last Room.
   def buildFloor(floor_arr)
      i = 1;
      @room_arr[0].buildRoom(nil, @room_arr[1])
      while i < @num_of_rooms.to_i-1
         @room_arr[i].buildRoom(@room_arr[i-1], @room_arr[i+1])
         i = i + 1;
      end
      @room_arr[i].buildRoom(@room_arr[1], floor_arr)
   end

   # Passes the Player into the first room on the Floor.
   def start(player)
      @room_arr[0].enter(player)
   end
end
