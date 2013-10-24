# James Browning - 140726
# Joey DeLorenzo - 141560
#
# Ruby Phase 2
#
# 

require "Game"

width = `/usr/bin/env tput cols`.to_i
height = `/usr/bin/env tput lines`.to_i




puts `clear`


$fixedWidth = false
if width < 60 or height < 24
  puts "Please scale larger!"
  $fixedWidth = true
end

while width < 60 or height < 24
  width = `/usr/bin/env tput cols`.to_i 
  height = `/usr/bin/env tput lines`.to_i
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
  puts "Thank you for scaling your terminal!".center(width)
  puts "AND NOW........".center(width)
end
puts "\nWelcome to Ruby Quest v0.8\n\n"

puts "Press 'ENTER' to continue...."

gets #wait for user input

puts `clear`

puts "Please choose an option:"
puts "\t1. New game"
puts "\t2. Quit"
$option = gets.chomp

if $option.to_i == 1
	game = Game.new()
else
	puts "Goodbye!"
end


