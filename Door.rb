# @author Joey De Lorenzo
# @author Trey Browning

class Door  
  def buildObject(n)  
                  @nextRoom = n
  end 
  
  def open(player)
      width = `/usr/bin/env tput cols`.to_i
    
      if(@nextRoom.class.name == "Room")
              @nextRoom.enter(player)
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
              nextFloor = @nextRoom.shift
              puts "This door is leads to a stair case..."
              puts "You walk up the dark, dannk staircase onto the next floor..."
              puts "[PRESS ANY KEY]".center(width)
              system("stty raw -echo")
              STDIN.getc
              system("stty -raw echo")
              
              nextFloor.buildFloor(@nextRoom)
              nextFloor.start(player)
      else
              puts "You have reached the end."
      end
  end
end
