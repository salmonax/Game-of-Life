require './lib/cell'
require './lib/grid'
require './lib/pattern'

puts "Welcome to the Game of Life."

puts "Watch this..."

puts "How big do you want your grid to be? (hint: we've decided for you.)"
#grid = Grid.new(gets.chomp.to_i)

grid = Grid.new(50)
puts "Please press enter to evolve."


gliderSE = Pattern.new(:glider).form
gliderSW = Pattern.new(:glider).rotate_right
gliderNW = Pattern.new(:glider).rotate_180
gliderNE = Pattern.new(:glider).rotate_left

middle = grid.length/2

grid.build
grid.give_neighbors

# grid.stamp_pattern(gliderSE,middle,middle)
# grid.stamp_pattern(gliderSW,middle,middle-4)
# grid.stamp_pattern(gliderNW,middle-4,middle-4)
# grid.stamp_pattern(gliderNE,middle-4,middle)

puts grid.display("@","_")


puts "All right, kids, hit enter to iterate!!! WOOO!"
until gets.chomp == 'e'
  grid.evolve_all
  grid.bake_all
  puts grid.display("@","_")
end
#grid.tick