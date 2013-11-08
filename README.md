RubyQuest
=========

To run: "ruby RubyQuest.rb"

Ruby Quest is a game created by two students at USNA for their Programming Languages class. 

The game is a text base dungeon crawler RPG, with randomly generated rooms, objects, and characters the player interacts with. 
The only data structures used in the game are arrays, with Rooms, Objects, and Floors each being kept in their own Array. 
RubyQuest is tested for both Ruby 1.8.7 and 1.9.3. Different methods are used (.sample or .choice), and since the manner
in which "require" works changed, adjustments were made for that as well.

Because Ruby does not check to see if an object has a certain method until it tries to use it, we are able to store rooms and floors
in the same variable, and have the two different methods above (.choice and .sample) in our code.

This is our first real program in Ruby, which is why most of the code is relatively simple.

Written by James Browning and Joey DeLorenzo.
GitHub: https://github.com/jpbrowning/RubyQuest