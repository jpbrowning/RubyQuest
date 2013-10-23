# Joey De Lorenzo

# Object.rb


class QuestObject
  attr_accessor :obj_name
  attr_accessor :obj_attr
  attr_accessor :obj_secondattr
  
  def initialize( objn, obja, objsa )
    $obj_name = objn
    $obj_attr = obja
    $obj_secondattr = objsa
  #end

  #def sayObject()
    print $obj_name
    print " which is "
    print $obj_attr
    print " & "
    puts $obj_secondattr
  end
  
end


#this is a test
