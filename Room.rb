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
  @player
  
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
  
  def enter(p)
   @player = p
  	puts `clear`
  	puts "You enter a room.\n\n"
  	menu()
  end
  
  def menu()
   puts "What would you like to do?"
  	puts "\t1. Look around.\n"
  	puts "\t2. Check inventory.\n"
  	puts "\t3. Pick up object.\n"
  	puts "\t4. Open door to next room.\n"
  	
  	system("stty raw -echo")
  	@answer = STDIN.getc
  	system("stty -raw echo")
  	
  	if @answer.chr == '1'
  		lookAround()
  		userIn()
  		menu()
  	elsif @answer.chr == '2'
  	   @player.checkItems()
  	   userIn()
  	   menu()
  	   
  	elsif @answer.chr == '3'
  	
  	   if @num_objs.to_i == 0
   	  puts "\nThere is nothing interesting in this room."
   	  
      else
   	  puts "\nPick up which object?"
   	  o = 1
		  for obj in @objs_arr
		    printf("\t" + o.to_s + ". ")
	  		 obj.inspect()
	  		 o = o + 1
	  	  end
	  	  system("stty raw -echo")
		  @answer = STDIN.getc
		  system("stty -raw echo")
		  
		  @answer = @answer.chr.to_i - 1
		  puts @answer
		  
		  if @answer <= @objs_arr.size - 1
		  	 printf("You have picked up ")
		  	 @objs_arr[@answer].inspect()
		    @player.pickUp(@objs_arr[@answer])
		    @objs_arr.delete_at(@answer)
		  else
		    puts "Invalid number"
		  end
		  
	  	end
  	   userIn()
  	   menu()
  	   
  	elsif @answer.chr == '4'
  		puts "\nYou approach the door, and rest your hand on the rough surface."
  		userIn()
  	   @door.open(@player)
  	end
  end
  
  #This prints out PRESS ANY KEY and waits for input from user
  def userIn()
    printf("\n[PRESS ANY KEY] ")
    gets
  	puts `clear`
  end
  
  def lookAround()
   i = 0
   
   printf("\nYou look around the room. Upon closer inspection, you notice")
   
   if @objs_arr.size == 0
   	puts "\nthat there is nothing interesting in this room."
   else
   	puts ":\n\n"
		for obj in @objs_arr
	  		obj.inspect()
	  	end
   end
  end
end
