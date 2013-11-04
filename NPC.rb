# Joey De Lorenzo
# James Browning

# NPC.rb

# This class stores an NPC object, and keeps track of his stats.

class NPC

   # Create NPC at certain level.
   def initialize(name, level)
      @name = name
      @level = level
      @hp = 10*level
      @mp = 5*level
   end

   # Return NPC's name.
   def getName()
      return @name
   end

   # Returns the NPC's Health.
   def getHealth()
      return @hp
   end

   # Subtract the damage taken from the NPC's total HP.
   def takeHit(x)
      @hp = @hp - x
      return @hp
   end

   # Return a number based on the NPC level +/- 2.
   def attack()
      return @level + rand(3) - rand(3)
   end

   # Returns true of the NPC is alive, false if not.
   def isAlive()
      if @hp > 0
         return true
      else
         return false
      end
   end
end
