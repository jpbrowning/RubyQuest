# Joey De Lorenzo
# James Browning

# Room.rb


# This class handles rooms in our adventure text game
# Rooms are randomly generated-- this means that the contents
# within the room are never the same.

require "QuestObject"

class Room
  attr_accessor :objs_arr
  $num_objs


  def initialize( x )
    $num_objs = x
    $objs_arr = Array.new($num_objs)
  end
    
  def buildRoom()
    i = 0
    
    if $num_objs == 0 		#Handle empty room
    	puts "Nothing particularly interesting."
    end
    
    while i < $num_objs
      q = QuestObject.new
      $objs_arr << q.buildObject
      i = i + 1
    end
    
  end
end
