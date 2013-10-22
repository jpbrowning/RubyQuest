# Joey De Lorenzo
# James Browning

# Room.rb


# This class handles rooms in our adventure text game
# Rooms are randomly generated-- this means that the contents
# within the room are never the same.


class Room
  objs = [Door, Chest, Knife, Body, Vial, Key, Windows, Herb]
  doorAttr = [Old, New, Dusty, Moldy, Broken, Creaky]
  chestAttr = [Large, Small, Glowing]
  knifeAttr = [Sharp, Dull]
  bodyAttr = [Rotting, Fresh, Bloodied]
  vialAttr = [Large, Small, Max]
  windowAttr = [Broken, Clear, Opaque, Opened, Closed]
  herbAtt = [Green, Yellow, Red]
  
  def buildRoom(x,y,z)
    objX = objs[x]
    objY = objs[y]
    objZ = objs[z]
    
    case x
    when 0
      attrX = doorAttr[Random.rand(5)]
    when 1
      attrX = chestAttr[Random.rand(2)]
    when 2
      attrX = knifeAttr[Random.rand(1)] 
    when 3
      attrX = bodyAttr[Random.rand(2)]
    when 4
      attrX = vialAttr[Random.rand(2)] 
    when 5
      attrX = windowAttr[Random.rand(4)] 
    when 6
      attrX = herbAttr[Random.rand(2)]
    end
    
    case Y
    when 0
      attrY = doorAttr[Random.rand(5)]
    when 1
      attrY = chestAttr[Random.rand(2)]
    when 2
      attrY = knifeAttr[Random.rand(1)] 
    when 3
      attrY = bodyAttr[Random.rand(2)]
    when 4
      attrY = vialAttr[Random.rand(2)] 
    when 5
      attrY = windowAttr[Random.rand(4)] 
    when 6
      attrY = herbAttr[Random.rand(2)] 
    end
    
    case z
    when 0
      attrZ = doorAttr[Random.rand(5)]
    when 1
      attrZ = chestAttr[Random.rand(2)]
    when 2
      attrZ = knifeAttr[Random.rand(1)] 
    when 3
      attrZ = bodyAttr[Random.rand(2)]
    when 4
      attrZ = vialAttr[Random.rand(2)] 
    when 5
      attrZ = windowAttr[Random.rand(4)] 
    when 6
      attrZ = herbAttr[Random.rand(2)] 
    end
    
    firstObj = Object.new(objX,attrX)
    secondObj = Object.new(objY,attrY)
    thirdObj = Object.new(objZ,attrZ)
  end
  
  
end