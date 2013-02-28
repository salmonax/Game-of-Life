require './lib/cell'
require './lib/grid'

"Welcome to the Game of Life."

"Watch this..."

grid = Grid.new(3)

puts "Please press enter to evolve."
 

grid.build
puts grid.display
grid.give_neighbors
grid.tick