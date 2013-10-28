# @author Joey De Lorenzo
# @author Trey Browning

class Door  
  def buildObject(n)  
  		@nextRoom = n
  end 
  
  def open()
      @nextRoom.enter()
  end
  
end
