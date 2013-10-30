# Joey De Lorenzo
# James Browning

# Player.rb

# This class stores the player object, and keeps track of his stats.

require "QuestObject"

class Player
  @name
  @level
  @hp
  @mp
  @items
  
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
  
  # Return a number based on two times the player level +/- 2.
  def attack()
    return @level * 2 + rand(3) - rand(3)
  end
  
  # Pick up a QuestObject from a Room
  def pickUp(i)
    @items << i
  end
  
  # Output the content of the Player's inventory to the screen.
  def checkItems()
    if @items.size == 0
      puts "\nYour inventory is empty"
    else
      puts "\nYour inventory contains: "
      for item in @items
        item.inspect()
      end
    end
  end
end
