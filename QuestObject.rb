# Joey De Lorenzo

# Object.rb

# QuestObjects, with their various attribues, are stored as this class.


class QuestObject
   attr_accessor :obj_name
   attr_accessor :obj_attr
   attr_accessor :obj_secondattr
   attr_accessor :obj_pickable
   attr_accessor :combat_usability

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
      @x = -1
      while @x < 0
	@x = rand(12)-1
      end
      
      
      if @x == 8 
	@objX = $objs[4]
      elsif @x == 9
      	@objX = $objs[4]
      elsif @x == 10
      	@objX = $objs[4]
      elsif @x == 11
	@objX = $objs[8]
      elsif @x == 12
	@objX = $objs[8]
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
	 @combat_usability = true
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
      #puts "X is currently: %i." % @x
   end

   def getName()
     return @obj_name
   end

   def getPickable()
     return @obj_pickable
   end

   def getFAttr()
     return @obj_attr
   end

   def getSAttr()
     return @obj_secondattr
   end

   def getCUsability()
     return @combat_usabilty
   end
end
