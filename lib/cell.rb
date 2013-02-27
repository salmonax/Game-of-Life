class Cell
  attr_reader :status
  attr_reader :x
  attr_reader :y

  def initialize(x,y,life=1)
    @x = x
    @y = y
    @status = Kernel.rand(life)
    @neighbors = []
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

end