class Grid
  attr_reader :length, :grid
  def initialize(length)
    @length = length
    @grid = Array.new(@length) {Array.new(@length) {0}}
  end

  def build
    built_grid = @grid.each_with_index do |row, xi|
      @grid.each_with_index do |column, yi|
        @grid[xi][yi] = Cell.new(xi, yi, 1)
      end
    end
    built_grid
  end

  def give_neighbors
    @length.times do |xi|
      @length.times do |yi|
        show_around(xi,yi)
      end
    end
  end  

  def show_around(row,column)
    neighbors = []
    (-1..1).each do |offset_row|
      (-1..1).each do |offset_column|
        next if offset_row == 0 && offset_column == 0
        wrapped_row = (row+offset_row) % @length
        wrapped_column = (column+offset_column) % @length
        neighbors.push(@grid[wrapped_row][wrapped_column])
      end
    end
    @grid[row][column].add_neighbors(neighbors)
    neighbors
  end

  def bake_all
    @grid.flatten.each { |cell| cell.bake }
  end

  def evolve_all
    @grid.flatten.each { |cell| cell.evolve }
  end

  def display(live="1",dead="0")         
    display_string = ""
    @grid.each do |row|
      row.each do |cell| 
        display_string << cell.symbol(live,dead) << " "
      end
      display_string << "\n"
    end
    display_string
  end
  
  def stamp_pattern(pattern,row_index=0,column_index=0)
    pattern.each_index do |i|
      pattern.each_index do |k|
        @grid[(i+row_index) % @length][(k+column_index) % @length].force_status(pattern[i][k])
      end
    end
  end

end