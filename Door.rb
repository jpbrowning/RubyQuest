# @author Joey De Lorenzo
# @author Trey Browning

class Door  
  
  # Pass the next room in.
  def buildObject(n)  
  		@nextRoom = n
  end 
  
  # Go to where the Door leads, be it a Room or an Array of Rooms (a floor)
  def open()
  		if(@nextRoom.class.name == "Room")
      	@nextRoom.enter()
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
      	nextFloor = @nextRoom.shift
      	nextFloor.buildFloor(@nextRoom)
      	nextFloor.start()
      else
      	puts "You have reached the end."
      end
  end
end
