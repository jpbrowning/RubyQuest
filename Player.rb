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
  
  def initialize(name)
    @name = name
    @level = 1
    @hp = 20
    @mp = 10
    @items = []
  end
  
  def getName()
    return @name
  end
  
  def takeHit(x)
    @hp = @hp - x
    return @hp
  end
  
  def attack()
    return @level * 2 + rand(3) - rand(3)
  end
  
  def pickUp(i)
    @items << i
  end
  
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
