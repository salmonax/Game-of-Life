require './lib/cell'
require './lib/grid'

"Welcome to the Game of Life."

"Watch this..."

puts "How big do you want your grid to be?"
grid = Grid.new(gets.chomp.to_i)
puts "Please press enter to evolve."


grid.build
puts grid.display
grid.give_neighbors

puts "All right, kids, hit enter to iterate!!! WOOO!"
until gets.chomp == 'e'
  grid.evolve_all
  grid.bake_all
  puts grid.display
end
#grid.tick