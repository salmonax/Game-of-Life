class Cell
  attr_reader :status
  attr_reader :x
  attr_reader :y
  attr_reader :neighbors

  def initialize(x,y,life=1)
    @x = x
    @y = y
    @status = Kernel.rand(life)
    @neighbors = [[-1,-1],[-1,0][-1,1],[0,-1],[0,1],[1,-1][1,0],[1,1]]
  end

  def add_neighbors(neighbor_array)
    @neighbors = neighbor_array
  end

  def switch
    if @status == 0
      @status = 1
    else
      @status = 0
    end  
  end 

  def count_alive
    alive = 0
    @neighbors.each do |cell|
      alive += 1 if cell.status == 1
    end
    alive
  end

  def evolve
    if (count_alive > 3 || count_alive < 2) && @status == 1
      switch
    elsif count_alive == 3 && @status == 0
      switch
    else
      @status
    end
  end

end