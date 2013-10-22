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
  
  objRan = Random.rand(8) + 1
  
end