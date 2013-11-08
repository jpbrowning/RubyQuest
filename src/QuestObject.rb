# James Browning
# Joey DeLorenzo

# Object.rb

# QuestObjects, with their various attribues, are stored as this class. 
# They are randomly generated.

class QuestObject
   
   # Objects and attributes for the random number generator to select from.
   $objs = ["Door", "Chest", "Knife", "Body", "Vial", "Key", "Windows", "Herb"]
   $doorAttr = ["Old", "New", "Dusty", "Moldy", "Broken", "Creaky"]
   $doorAttrS = ["White", "Brown", "Maple", "Pine", "Cherry Wood", "Bamboo"]
   $chestAttr = ["Large", "Small", "Glowing"]
   $chestAttrS = ["Omnious", "Creepy", "On-Fire"]
   $knifeAttr = ["Sharp", "Dull"]
   $knifeAttrS = ["Matte", "Glistening"]
   $bodyAttr = ["Rotting", "Fresh", "Bloodied"]
   $bodyAttrS = ["Covered in flies", "Clothed", "Naked"]
   $vialAttr = ["Large", "Small", "Max"]
   $vialAttrS = ["Purple", "Red", "Yellow"]
   $keyAttr = ["Large", "Small"]
   $keyAttrS = ["Ornate", "Plain"]
   $windowAttr = ["Broken", "Clear", "Opaque", "Opened", "Closed"]
   $windowAttrS = ["Covered", "Barred", "Taped Off", "Large", "Small"]
   $herbAttr = ["Green", "Yellow", "Red"]
   $herbAttrS = ["Fresh", "Wilted", "Spritely"]
   
   # Decide which object this instance will be.
   def initialize
      # Random number between 0 and 12
      @x = rand(12) + 1
      
      # We want vials and herbs to have higher chance to show up in rooms.         
      if @x > 8 and @x < 10
         @objX = $objs[4]
      elsif @x >= 10
         @objX = $objs[7]
      else
         @objX = $objs[@x]
      end
   end
   
   # Apply appropriate attributes for this object type.
   def buildObject()
      case @x
      when 0
         attrX = $doorAttr[rand(6)]
         attrSX = $doorAttrS[rand(6)]
         @obj_pickable = false
         @combat_usability = false
      when 1
         attrX = $chestAttr[rand(3)]
         attrSX = $chestAttrS[rand(3)]
         @obj_pickable = false
         @combat_usability = false
      when 2
         attrX = $knifeAttr[rand(2)] 
         attrSX = $knifeAttrS[rand(2)]
         @obj_pickable = true
         @combat_usability = true
      when 3
         attrX = $bodyAttr[rand(3)]
         attrSX = $bodyAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      when 4
         attrX = $vialAttr[rand(3)]
         attrSX = $vialAttrS[rand(3)]  
         @obj_pickable = true
         @combat_usability = true
      when 5
         attrX = $keyAttr[rand(2)] 
         attrSX = $keyAttrS[rand(2)] 
         @obj_pickable = true
         @combat_usability = false
      when 6
         attrX = $windowAttr[rand(5)] 
         attrSX = $windowAttrS[rand(5)] 
         @obj_pickable = false
         @combat_usability = false
      when 7
         attrX = $herbAttr[rand(3)]
         attrSX = $herbAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      when 8
         attrX = $vialAttr[rand(3)]
         attrSX = $vialAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      when 9
         attrX = $vialAttr[rand(3)]
         attrSX = $vialAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      when 10
         attrX = $vialAttr[rand(3)]
         attrSX = $vialAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      when 11
         attrX = $herbAttr[rand(3)]
         attrSX = $herbAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      when 12
         attrX = $herbAttr[rand(3)]
         attrSX = $herbAttrS[rand(3)]
         @obj_pickable = true
         @combat_usability = true
      end
      
      @obj_name = @objX
      @obj_attr = attrX
      @obj_secondattr = attrSX
   end
   
   # Print the object and it's attributes to the screen.
   def inspect()    
      print @obj_name
      print " which is "
      print @obj_attr
      print " & "
      puts @obj_secondattr
   end
   
   # Easter egg function.
   def makeTuba()
      @obj_name = "Tuba"
      @obj_attr = "Gold"
      @obj_secondattr = "Radiant"
   end
   
   # Get the object's name.
   def getName()
      return @obj_name
   end
   
   # Return whether or not ths item can be added to the Player's inventory.
   def getPickable()
      return @obj_pickable
   end
   
   # Get the first attribute of the object.
   def getFAttr()
      return @obj_attr
   end
   
   # Get the second attribute of the object.
   def getSAttr()
      return @obj_secondattr
   end
   
   # Determine if the item can be used in combat.
   def getCUsability()
      return @combat_usability
   end
end
