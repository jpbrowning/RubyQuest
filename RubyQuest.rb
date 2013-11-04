# James Browning - 140726
# Joey DeLorenzo - 141560
#
# Ruby Phase 2
#
# 

require_relative "Game"

# Gets size of user's terminal window.
width = `/usr/bin/env tput cols`.to_i
height = `/usr/bin/env tput lines`.to_i

puts `clear`

# This checks to make sure that the user's terminal is large enough.
$fixedWidth = false
if width < 60 or height < 24
   puts "Please scale larger!"
   $fixedWidth = true
end

# This does not let the user proceed until their terminal window is large enough.
while width < 60 or height < 24
   width = `/usr/bin/env tput cols`.to_i 
   height = `/usr/bin/env tput lines`.to_i
end


# This is sweet ASCII art. A website helped us with the letters.
# http://www.network-science.de/ascii/
# The ruby is our creation.

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

# Thank the user for dealing with our scaling requirements.
if $fixedWidth
   puts "\n"
   puts "Thank you for scaling your terminal!".center(width)
   puts "AND NOW........".center(width)
end

puts "\nWelcome to Ruby Quest v0.9\n\n"

puts "Press 'ENTER' to continue...."

# Wait for user to input ENTER
gets 
@leaveThisScreen = false
while !@leaveThisScreen
  puts `clear`

  puts "Please choose an option:"
  puts "\t1. New game"
  puts "\t2. Quit\n\n"

  # This grabs the first key the user types, and does not echo it to terminal.
  system("stty raw -echo")
  $option = STDIN.getc
  system("stty -raw echo")

  # Start the game!
  if $option.chr == '1'
    thisGame = Game.new()
    thisGame.startGame()
    @leaveThisScreen = true
  elsif $option.chr == '2'
    puts "Goodbye!\n\n"
    @leaveThisScreen = true
  else
    puts "That isn't a selection...why would you choose that?"
    puts "Are you being serious? Now you get to wait a while before you try again."
    puts "\n"
    sleep(4)
  end
end
