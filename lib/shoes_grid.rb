class ShoesGrid
  attr_reader :grid
  def initialize(grid,slot)
    @grid = grid
    @grid.build
    @grid.give_neighbors
    @slot = slot
    draw_initial_state
   # draw_from_data
  end

  def update
    @grid.evolve_all
    @grid.bake_all
    draw_from_data
  end

  def restart
    @grid = Grid.new(25)
    @grid.build
    @grid.give_neighbors
  end

  def draw_from_data
    cell_array = @grid.grid.flatten
    @slot.app do
      @display_shapes.each_with_index do |rectangle, i|
        cell_array[i].status == 1 ? rectangle.show : rectangle.hide
      end
    end
  end

  def draw_initial_state
    data_grid = @grid
    @slot.app do
      @display_shapes = []
      cell_pixel_size = 10
      cell_margin = 1
      grid_margin = 15
      data_grid.grid.each_with_index do |row_array, row_index|
        top_offset = row_index*(cell_pixel_size+cell_margin)+grid_margin
        row_array.each_with_index do |cell,column_index|
          left_offset = column_index*(cell_pixel_size+cell_margin)+grid_margin
          cell_color = rgb(0,0,0)
          stroke cell_color
          fill cell_color
          @display_shapes << rect(left_offset,top_offset,10,10)
        end
      end
    end
  end
end