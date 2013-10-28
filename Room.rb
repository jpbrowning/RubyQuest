# Joey De Lorenzo
# James Browning

# Room.rb


# This class handles rooms in our adventure text game
# Rooms are randomly generated-- this means that the contents
# within the room are never the same.

require "QuestObject"
require "Door"

class Room
  attr_accessor :objs_arr
  @num_objs
  @lastRoom
  @door
  
  def initialize(x)
    @num_objs = x
    @objs_arr = Array.new(x) { QuestObject.new }
  end
    
  def buildRoom(l, n)
    i = 0
    
    @lastRoom = l
    @door = Door.new
    @door.buildObject(n)    
    
    for obj in @objs_arr
      obj.buildObject
    end
  end
  
  def enter()
  	puts "You enter a room. Would you like to look around? "
  	@answer = gets.chomp
  	
  	if @answer.to_s == "yes"
  		lookAround()
  	end
  end
  
  def lookAround()
   i = 0
   
   if @num_objs.to_i == 0
   	puts "There is nothing interesting in this room."
   end
   
  	for obj in @objs_arr
  		obj.inspect()
  	end
   
   puts "Would you like to open the door?"
   	@answer = gets.chomp
   	if @answer.to_s == "yes"
   		@door.open
  		end
  end
end
