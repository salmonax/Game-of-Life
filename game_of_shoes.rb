require 'green_shoes'
require './lib/cell'
require './lib/grid'
require './lib/pattern'
require './lib/shoes_grid'

Shoes.app height: 335, width: 305, title: 'A Game of Shoes' do
  @display_slot = stack
  @shoes_grid = ShoesGrid.new(Grid.new(25),@display_slot)
  animate(15) do |frame|
    @shoes_grid.update
  end
 
  para "R to Restart.", top: 305, align: 'center'
  keypress do |k|
    case k
    when "r"
      @shoes_grid.restart
    end
  end

end