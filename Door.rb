# @author Joey De Lorenzo
# @author Trey Browning

class Door
   width = `/usr/bin/env tput cols`.to_i

   
   # Initializes a Door, leading to the next Room.
   def buildObject(n)  
      @nextRoom = n
   end 

   # Passes the Player into the next room, or floor.
   def checkNext()
      if(@nextRoom.class.name == "Room")
	return 0
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
	return 1
      else 
	return 2
      end
   end

   def open(player)
      if(@nextRoom.class.name == "Room")
         @nextRoom.enter(player)
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
	 puts `clear`
	 puts "You ascend the stairs to the next floor"
	 puts "Please wait....."
	 sleep(1)
         nextFloor = @nextRoom.shift
         nextFloor.buildFloor(@nextRoom)
         nextFloor.start(player)
      else
         puts "You have reached the end."
      end
   end
end
