# Joey De Lorenzo
# James Browning

# Room.rb


# This class handles rooms in our adventure text game
# Rooms are randomly generated-- this means that the contents
# within the room are never the same.

require "QuestObject"

class Room
  attr_accessor :object_one
  attr_accessor :object_two
  attr_accessor :object_three
  
  
  $objs = ["Door", "Chest", "Knife", "Body", "Vial", "Key", "Windows", "Herb"]
  $doorAttr = ["Old", "New", "Dusty", "Moldy", "Broken", "Creaky"]
  $chestAttr = ["Large", "Small", "Glowing"]
  $knifeAttr = ["Sharp", "Dull"]
  $bodyAttr = ["Rotting", "Fresh", "Bloodied"]
  $vialAttr = ["Large", "Small", "Max"]
  $windowAttr = ["Broken", "Clear", "Opaque", "Opened", "Closed"]
  $herbAtt = ["Green", "Yellow", "Red"]
  
  def buildRoom()
  

    x = rand(5)
    y = rand(5)
    z = rand(5)
    objX = $objs[x]
    objY = $objs[y]
    objZ = $objs[z]
    
    case x
    when 0
      attrX = $doorAttr[rand(5)]
      attrSX = $doorAttr[rand(5)]
    when 1
      attrX = $chestAttr[rand(2)]
      attrSX = $chestAttr[rand(2)]
    when 2
      attrX = $knifeAttr[rand(1)] 
      attrSX = $knifeAttr[rand(1)]
    when 3
      attrX = $bodyAttr[rand(2)]
      attrSX = $bodyAttr[rand(2)]
    when 4
      attrX = $vialAttr[rand(2)]
      attrSX = $vialAttr[rand(2)]  
    when 5
      attrX = $windowAttr[rand(4)] 
      attrSX = $windowAttr[rand(4)] 
    when 6
      attrX = $herbAttr[rand(2)]
      attrSX = $herbAttr[rand(2)]
    end
    
    case y
    when 0
      attrY = $doorAttr[rand(5)]
      attrSY = $doorAttr[rand(5)]
    when 1
      attrY = $chestAttr[rand(2)]
      attrSY = $chestAttr[rand(2)]
    when 2
      attrY = $knifeAttr[rand(1)]
      attrSY = $knifeAttr[rand(1)] 
    when 3
      attrY = $bodyAttr[rand(2)]
      attrSY = $bodyAttr[rand(2)]
    when 4
      attrY = $vialAttr[rand(2)]
      attrSY = $vialAttr[rand(2)] 
    when 5
      attrY = $windowAttr[rand(4)] 
      attrSY = $windowAttr[rand(4)] 
    when 6
      attrY = $herbAttr[rand(2)] 
      attrSY = $herbAttr[rand(2)] 
    end
    
    case z
    when 0
      attrZ = $doorAttr[rand(5)]
      attrSZ = $doorAttr[rand(5)]
    when 1
      attrZ = $chestAttr[rand(2)]
      attrSZ = $chestAttr[rand(2)]
    when 2
      attrZ = $knifeAttr[rand(1)] 
      attrSZ = $knifeAttr[rand(1)]
    when 3
      attrZ = $bodyAttr[rand(2)]
      attrSZ = $bodyAttr[rand(2)]
    when 4
      attrZ = $vialAttr[rand(2)] 
      attrSZ = $vialAttr[rand(2)] 
    when 5
      attrZ = $windowAttr[rand(4)] 
      attrSZ = $windowAttr[rand(4)] 
    when 6
      attrZ = $herbAttr[rand(2)] 
      attrSZ = $herbAttr[rand(2)] 
    end
    
    $object_one = QuestObject.new(objX,attrX,attrSX)
    $object_two = QuestObject.new(objY,attrY,attrSY)
    $object_three = QuestObject.new(objZ,attrZ,attrSZ)
  end
end
