class Cell
  attr_reader :status, :new_status
  attr_reader :x
  attr_reader :y

  def initialize(x,y,life=1)
    @x = x
    @y = y
    @status = Kernel.rand(life)
    @neighbors = []
    @new_status = @status
  end

  def add_neighbors(neighbor_array)
    @neighbors = neighbor_array
  end

  def switch
    if @status == 0
      @new_status = 1
    else
      @new_status = 0
    end  
  end 

  def count_alive
    alive = 0
    @neighbors.each do |cell|
      alive += 1 if cell.status == 1
    end
    alive
  end

  def bake
    @status = @new_status
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