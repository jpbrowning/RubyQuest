# James Browning
# Joey DeLorenzo

# Room.rb


# This class handles rooms in our adventure text game
# Rooms are randomly generated-- this means that the contents
# within the room are never the same.

# Files needed for Room to function
require "QuestObject"
require "Door"
require "NPC"

class Room
   
   # These are the various Room and Monster attributes.
   $arr_room_attr = ["dark", "well it", "cold", "drafty", "hot", "smelly", "humid" ] 
   $npc_names = ["Orc", "Giant Wasp", "Troll", "Goblin", "Zombie", "Dr. Roche"]
   $room_count = 1
   $floor_count = 1
   $thisRet = 2
   $width = `/usr/bin/env tput cols`.to_i
   
   # Decide if there will be an NPC in this room or not, and create 
   # x QuestObjects in the room.
   def initialize(x)
   if(RUBY_VERSION.to_f < 1.9)
         @hasNPC = [true, false].choice
      else
         @hasNPC = [true, false].sample
      end
      @num_objs = x
      @objs_arr = Array.new(x) { QuestObject.new }
   end
   
   # Taken from http://stackoverflow.com/questions/1489183/colorized-ruby-output
   def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
   end
   
   def red(text); colorize(text, 31); end
   def green(text); colorize(text, 32); end   
   def pink(text); colorize(text, 35); end
   def yellow(text); colorize(text, 33); end   
    
   # Put the door in here, and link the room we just came from, and 
   # the next one to this Room. Also build our QuestObjects. The variables
   # l and n represent the previous room and the next one.
   
   def buildRoom(l, n)
      i = 0
      
      @lastRoom = l
      @battle = false
      @door = Door.new
      @door.buildObject(n)    
      
      # If there is a bad guy in this room, build and name it.
      if @hasNPC
         @NPC = NPC.new($npc_names[rand(5)], 1)
      end
      
      # Build the objects in this room, if there are any.
      for obj in @objs_arr
         obj.buildObject
      end   
   end
   
   # Enter this room.
   def enter(p)
      x = rand(7)
      @player = p
      puts `clear`
      puts "You enter a %s room.\n\n" % $arr_room_attr[x]
      menu() 
      if @hasNPC == true
         puts "...and see a %s blocking the next door!\n\n" % @NPC.getName()
      end
      menu()
   end
   
   # The basic Room menu. It lets you go to the next room, but only if
   # there is no NPC present, blocking the path.
   def menu()
      if $thisRet == 0
         $room_count = $room_count + 1
         $thisRet = 3
      elsif $thisRet == 1
         $floor_count = $floor_count + 1
         $room_count = 1
         $thisRet = 3
      else
      end  
      
      # This is for the player to see their progress.
      puts "You are currently in room %i on floor %i" % [$room_count, $floor_count]
      
      # HP status.
      print red("Current HP: ")
      puts @player.getHp()
      @widthCheck = 0
      while @widthCheck < $width
         print "_"
         @widthCheck = @widthCheck + 1
      end
      
      # Basic menu.
      puts "\n"
      puts "What would you like to do?"
      puts "\t1. Look around.\n"
      puts "\t2. Check inventory and status.\n"
      puts "\t3. Pick up object.\n"
      puts "\t4. Open door to next room.\n"
      
      # Only show this option if a bad guy exists.
      if @hasNPC == true
         puts "\t5. Interact with %s.\n" % @NPC.getName()
      end
      
      # Let the user quit.
      puts ""
      puts ""
      puts "\tq or 'Q'. If this game is too much, and you'd like to quit..."
      
      # This grabs the next character input by the user.
      system("stty raw -echo")
      @answer = STDIN.getc
      system("stty -raw echo")
      
      # Look around
      if @answer.chr == '1'
         lookAround()
         userIn()
         menu()
      
      # Check items and status
      elsif @answer.chr == '2'
         if @player.checkItems()
            puts "Would you like to use an item? (Y/N)"
            
            system("stty raw -echo")
            @answer = STDIN.getc
            system("stty -raw echo")
            
            if @answer.chr == 'Y' || @answer.chr == 'y'
               useItem()
            else
               # Do nothing
            end
         end
         userIn()
         menu()   	
      
      # Pick up objects
      elsif @answer.chr == '3'
         if @num_objs.to_i == 0
            puts "\nThere is nothing interesting in this room."         
         elsif @num_objs.to_i == 0 and @hasNPC
            puts "\nThere is nothing of interest in this room besides the lurking baddy in the corner..."         
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
             
            if @answer >= @objs_arr.size
               puts "Invalid Selection!"   
            elsif @answer <= @objs_arr.size - 1 and @objs_arr[@answer].getPickable()
               printf("\nYou have picked up ")
               @objs_arr[@answer].inspect()
               @player.pickUp(@objs_arr[@answer])
               @objs_arr.delete_at(@answer)
            elsif @objs_arr[@answer].getPickable() == false
               puts "You can't pick that up...."
            end
         end
         userIn()
         menu()
      
      # Go to the next room. Only works if there's no NPC present.
      elsif @answer.chr == '4'
         if @hasNPC == false
            puts "\nYou approach the door, and rest your hand on the rough surface."
            $thisRet = @door.checkNext()
            userIn()
            @door.open(@player)
         else
            puts "\n%s is blocking the door!" % @NPC.getName()
            userIn()
            menu()
         end      
      
      # Interact with the NPC in the room.
      elsif @answer.chr == '5'      
         interact()
         userIn()
         menu()   	
      
      # Quit the game.
      elsif @answer.chr == 'q' or @answer.chr == 'Q'
         puts "Goodbye until next time!"
         exit
         
      # Not a proper input.
      else
         puts "Not a valid option!"
         userIn()
         menu()   
      end
   end
   
   #T his prints out PRESS ANY KEY and waits for input from user
   def userIn()
      printf("\n[PRESS ANY KEY] ")
      system("stty raw -echo")
      @answer = STDIN.getc
      system("stty -raw echo")
      puts `clear`
   end
   
   # This interacts with the NPC. Right now you just fight.
   def interact()
      puts `clear`
      puts yellow('You begin to fight!')
      @battle = true
      puts "\n\n"
      
      # This is the "Battle Loop".
      while @NPC.isAlive()
         puts "What would you like to do?"
         puts "\t1. Attack %s." % @NPC.getName()
         puts "\t2. Use item"
         puts "\t3. Fall back and take cover!\n\n"
         
         # Get the next key input by the user.
         system("stty raw -echo")
         @answer = STDIN.getc
         system("stty -raw echo")
      
         # Attack.
         if @answer.chr == '1'
            puts `clear`
            damage = @player.attack(0)
            if damage > 0
               puts "You attack %s for %s!\n" % [@NPC.getName(), damage.to_s]
               @NPC.takeHit(damage)
               if @NPC.getHealth() < 1
                  puts "You have killed %s!\n\n" % @NPC.getName()
                  @hasNPC = false
                  break
               end
               puts "%s's health drops to %s!\n\n" % [@NPC.getName(), @NPC.getHealth().to_s]
            else
               puts "You missed!\n\n"
            end
            
         # Use Item.
         elsif @answer.chr == '2'
            retInt = @player.useItem(@battle)
            if retInt == 0
               # Do nothing
            elsif retInt >= 1
               damage = @player.attack(retInt)
               puts "You attack %s for %s!\n" % [@NPC.getName(), damage.to_s]
               @NPC.takeHit(damage)
               if @NPC.getHealth() < 1
                  puts "You have killed %s!\n\n" % @NPC.getName()
                  @battle = false
                  @hasNPC = false
                  break
               end
               puts "%s's health drops to %s!\n\n" % [@NPC.getName(), @NPC.getHealth().to_s]
            end
            
         # Fall back and take cover.
         elsif @answer.chr == '3'
            @battle = false
            break
            
         # Invalid option.
         else
            puts "Not a valid option! You've wasted a turn!"
         end
      
         puts "\n"      
      
         # The bad guy attacks the user.
         badDamage = @NPC.attack()
         
         # If he hits.
         if badDamage > 0
            puts "%s attacks you for %s!\n" % [@NPC.getName(), badDamage.to_s]
            @player.takeHit(badDamage)
            if @player.getHealth() < 1
               puts "You have died! Game over.\n\n"
               abort()
            end
            puts "Your health drops to %s!\n\n" % @player.getHealth().to_s
            
         # Sometimes he misses.
         else
            puts "%s missed!\n\n" % @NPC.getName()
         end
      end
   end
   
   # Use an item. 
   def useItem()
      @player.useItem(@battle)
   end
   
   # Inspect all of the QuestObjects in the Room.
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