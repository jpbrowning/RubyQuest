# James Browning - 140726
# Joey DeLorenzo - 141560
#
# Ruby Phase 2
#
# 

require "Room.rb"

width = `/usr/bin/env tput cols`.to_i




puts `clear`
puts width
$fixedWidth = false
if width < 60
	puts "Please extend terminal horizontally!"
	$fixedWidth = true
end

while width < 60
	width = `/usr/bin/env tput cols`.to_i 
end



puts "\n"

puts "O-----------------------------------------------O".center(width)
puts "| (                         )                   |".center(width)
puts "| )\\ )             (     ( /(       ____________|".center(width)
puts "|(()/(      (    ( )\\    )\\())     / /        \\ \\".center(width)
puts " | /(_))     )\\   )((_)  ((_)\\     /_/__________\\_\\".center(width)
puts " |(_))    _ ((_) ((_)_  __ ((_)    \\ \\          / /".center(width)
puts "|| _ \\  | | | |  | _ ) \\ \\ / /     \\ \\        / /".center(width)
puts "||   /  | |_| |  | _ \\  \\ V /       \\ \\      / /|".center(width)
puts "||_|_\\   \\___/   |___/   |_|         \\ \\    / / |".center(width)
puts "|                                     \\ \\  / /  |".center(width)
puts "|                            (         \\ \\/ /   |".center(width)
puts "|        (                   )\\ )    *  \\  /    |".center(width)
puts "|      ( )\\       (    (    (()/(  ` )   \\/     |".center(width)
puts "|      )((_)      )\\   )\\    /(_))  ( )(_       |".center(width)
puts "|     ((_)_    _ ((_) ((_)  (_))   (_(_())      |".center(width)
puts "|      / _ \\  | | | | | __| / __|  |_   _|      |".center(width)
puts "|     | (_) | | |_| | | _|  \\__ \\    | |        |".center(width)
puts "|      \\__\\_\\  \\___/  |___| |___/    |_|        |".center(width)
puts "O-----------------------------------------------O".center(width)

if $fixedWidth
	puts "\n"
	puts "Thank you for extending your terminal!".center(width)
	puts "AND NOW........".center(width)
end
puts "\nWelcome to Ruby Quest v0.2\n\n"
puts "Story... "


room1 = Room.new()
room1.buildRoom
puts room1.object_one
puts room1.object_two
puts room2.object_three

#testing Aptana...
#test comment number two....hi

#Browning Version
