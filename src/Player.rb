# Joey De Lorenzo
# James Browning

# Player.rb

# This class stores the player object, and keeps track of his stats.

require "QuestObject"

class Player

   # Create player at level 1.
   def initialize(name)
      @name = name
      @level = 1
      @hp = 20
      @mp = 10
      @items = []
   end

   # Return Player's name
   def getName()
      return @name
   end

   # Subtract the damage taken from the Player's total HP
   def takeHit(x)
      @hp = @hp - x
      return @hp
   end

   def prepItem(i)
     puts "%s"  % @items[i].getName()
   end

   def removeItem(i)
      @items.delete_at(i)
   end

   # Returns the Player's health.
   def getHealth()
      return @hp
   end

   # Return a number based on two times the player level +/- 2.
   def attack(q)
     if q == 0
      return @level * 2 + rand(3) - rand(3)
     elsif q == 1
      return 30
     elsif q == 2
       return 10
     end
   end

   # Pick up a QuestObject from a Room.
   def pickUp(i)
      @items << i	
   end

   def getSizeOfPack()
     return @items.size
   end

   def useObject(i)
      if i.getName() == "Herb" or "Vial"
	
      elsif i.getName() == "Knife"
      end
   end

   def useItemMenu() 
     if @items.size == 0
       puts "\nYour inventory is empty, there is nothing to use! You've wasted a turn!"
       puts "\n"
       return 0;
     elsif
       checkItems()
     
      #elsif
      #// puts "\t Your inventory contains, what would you like to use?: "
      #// x = 1
       #//while x < @items.size
	#//print "\t %i." % x
	#//item.inspect()
	#//x = x + 1
       #//end
     end

      system("stty raw -echo")
      @answer = STDIN.getc
      system("stty -raw echo")

      @answer = @answer.chr.to_i - 1

      if @items[@answer].getCUsability() == false
	puts "This isn't combat usable!"
	puts "......"
	puts "Hell-- why would you even try that?!"

      elsif @items[@answer].getName() == "Herb" or @items[@answer].getName() == "Vial" 
	if @items[@answer].getFAttr() == "Green"
	  @hp = @hp + 5
	  puts "Your HP has increased by 5!"
	elsif @items[@answer].getFAttr() == "Yellow"
	  @hp = @hp + 10
	  puts "Your HP has increased by 10!"
	elsif @items[@answer].getFAttr() == "Red"
	  @hp = @hp + 15
	  puts "Your HP has increased by 15!"
	elsif @items[@answer].getFAttr() == "Max"
	  @hp = @hp + 15
	  puts "Your HP has increased by 15!"
	elsif @items[@answer].getFAttr() == "Large"
	  @hp = @hp + 10
	  puts "Your HP has increased by 10!"
	elsif @items[@answer].getFAttr() == "Small"
	  @hp = @hp +5
	  puts "Your HP has increased by 5!"
	end
	if @items[@answer].getSAttr() == "Wilted"
	  @hp = @hp - 5
	  puts "Wilted herb deducted 5 hp!"
	  
	elsif @items[@answer].getSAttr() == "Purple"
	  @level = @level + 1
	  puts "\n"
	  puts "Plus 1 Attack Boost!"
	elsif @items[@answer].getSAttr() == "Yellow"
	  @level = @level + 2
	  puts "\n"
	  puts "Plus 2 Attack Boost!"
	end
	@items.delete_at(@answer)
	return 0;
      elsif @items[@answer].getName() == "Knife"
	if @items[@answer].getFAttr() == "Sharp"
	  attack(1);
	  return 1
	else
	  attack(2)
	  return 2;
	end
	@items.delete_at(@answer)
      end
   end

      





   # Output the content of the Player's inventory to the screen.
   def checkItems()
      x = 1
      if @items.size == 0
         puts "\nYour inventory is empty"
	 puts "\nYour current HP is: %i" % @hp
      else
         puts "\nYour inventory contains: "
         for item in @items
	  print "\t %i." % x
	  item.inspect()
	  x = x + 1
         end
	 puts "\nYour current HP is: %i" % @hp
      end
   end

   def getHp()
     return @hp
   end
end
