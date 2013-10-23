# Joey De Lorenzo

# Object.rb


class QuestObject
  attr_accessor :obj_name
  attr_accessor :obj_attr
  attr_accessor :obj_secondattr
  
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
  $windowAttr = ["Broken", "Clear", "Opaque", "Opened", "Closed"]
  $windowAttrS = ["Covered", "Barred", "Taped Off", "Large", "Small"]
  $herbAtt = ["Green", "Yellow", "Red"]
  $herbAttS = ["Fresh", "Wilted", "Spritely"]

  
  def buildObject()
    x = rand(5)

    objX = $objs[x]
    case x
    when 0
      attrX = $doorAttr[rand(5)]
      attrSX = $doorAttrS[rand(5)]
    when 1
      attrX = $chestAttr[rand(2)]
      attrSX = $chestAttrS[rand(2)]
    when 2
      attrX = $knifeAttr[rand(1)] 
      attrSX = $knifeAttrS[rand(1)]
    when 3
      attrX = $bodyAttr[rand(2)]
      attrSX = $bodyAttrS[rand(2)]
    when 4
      attrX = $vialAttr[rand(2)]
      attrSX = $vialAttrS[rand(2)]  
    when 5
      attrX = $windowAttr[rand(4)] 
      attrSX = $windowAttrS[rand(4)] 
    when 6
      attrX = $herbAttr[rand(2)]
      attrSX = $herbAttrS[rand(2)]
    end

    $obj_name = objX
    $obj_attr = attrX
    $obj_secondattr = attrSX
    print $obj_name
    print " which is "
    print $obj_attr
    print " & "
    puts $obj_secondattr

  end
end





#this is a test
