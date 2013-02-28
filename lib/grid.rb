class Grid

  def initialize(length)
    @length = length
    @grid = Array.new(@length) {Array.new(@length) {0}}
  end

  def build
    built_grid = @grid.each_with_index do |row, xi|
      row.each_with_index do |cell, yi|
        @grid[xi][yi] = Cell.new(xi, yi, 2)
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

  def show_around(x,y)
    neighbors = []
    (-1..1).each do |offset_x|
      (-1..1).each do |offset_y|
        next if offset_x == 0 && offset_y == 0
        wrapped_x = (x+offset_x) % @length
        wrapped_y = (y+offset_y) % @length
        neighbors.push(@grid[wrapped_x][wrapped_y])
      end
    end
    @grid[x][y].add_neighbors(neighbors)
    neighbors
  end

  def bake_all
    @grid.flatten.each { |cell| cell.bake }
  end

  def evolve_all
    @grid.flatten.each { |cell| cell.evolve }
  end

  def display         
    display_string = ""
    @grid.each do |row|
      row.each do |cell| 
        display_string << cell.status.to_s << " "
      end
      display_string << "\n"
    end
    display_string
  end

  
end