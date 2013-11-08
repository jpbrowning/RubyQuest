# James Browning
# Joey DeLorenzo

class Door
   width = `/usr/bin/env tput cols`.to_i   
   
   # Initializes a Door, leading to the next Room.
   def buildObject(n)  
      @nextRoom = n
   end 
   
   # Passes the Player into the next room, or floor. Ruby can return the actual name
   # of the next object, so we just reference that to determine where to go.
   def checkNext()
      if(@nextRoom.class.name == "Room")
         return 0
      elsif(@nextRoom.class.name == "Array" && @nextRoom.size > 0)
         return 1
      else 
         return 2
      end
   end
      
   # Opens the door, which moves the player to the next Room.
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
         puts "\n\nCongrats, %s. You have beaten RubyQuest!" % player.getName()
         exit
      end
   end
end
