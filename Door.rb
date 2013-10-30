# @author Joey De Lorenzo
# @author Trey Browning

class Door  
  def buildObject(n)  
                  @nextRoom = n
  end 
  
  def open(player)
      if(@nextRoom.class.name == "Room")
              @nextRoom.enter(player)
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
              nextFloor = @nextRoom.shift
              puts "This door is leads to a stair case..."
              puts "You walk up the dark, dannk staircase onto the next floor..."
              
              
              nextFloor.buildFloor(@nextRoom)
              nextFloor.start(player)
      else
              puts "You have reached the end."
      end
  end
end
