# @author Joey De Lorenzo
# @author Trey Browning

class Door
  
  $nextRoom
  
  def buildObject(n)  
  		$nextRoom = n
  end 
  
  def open()
      $nextRoom.enter()
  end
  
end
