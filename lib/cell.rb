class Cell
  attr_reader :status
  attr_reader :x
  attr_reader :y

  def initialize(x,y,life=2)
    @x = x
    @y = y
    @status = Kernel.rand(life)
    @neighbors = []
    @new_status = @status
  end

  def force_status(status)
    @status = status.to_i
  end 

  def add_neighbors(neighbor_array)
    @neighbors = neighbor_array
  end

  def switch
    @new_status = (@status == 0 ? 1 : 0)
  end 

  def count_alive
    @neighbors.inject(0) { |sum, cell| sum + cell.status }
  end

  def bake
    @status = @new_status
  end

  def evolve
    if ((count_alive > 3 || count_alive < 2) && @status == 1) || (count_alive == 3 && @status == 0)
      switch
    else
      @new_status = @status
    end
  end

  def symbol(live,dead)
    @status == 1 ? live.to_s : dead.to_s
  end

end