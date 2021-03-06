require 'spec_helper'

describe Grid do 
  context '#initialize' do
    it 'initializes a square grid of a given side length' do
      grid = Grid.new(6)
      grid.should be_an_instance_of Grid
    end  
  end

  context '#display_grid' do 
    it 'prints the grid all pretty like' do
      Cell.any_instance.stub(:status).and_return(0)
      Cell.any_instance.stub(:symbol).and_return('0')
      grid = Grid.new(4)
      grid.build
      grid.display.should eq "0 0 0 0 \n0 0 0 0 \n0 0 0 0 \n0 0 0 0 \n"
    end
  end

  context '#build' do 
    it 'should build a grid of cells based on length' do
      cell = double
      Cell.stub(:new).and_return(0)
      Kernel.stub(:rand).and_return(1)
      grid = Grid.new(4)
      grid.build.should eq [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
    end
  end


  context '#show_around' do
    it 'inserts an array of neighbors into each cell object after the grid is built' do
      Kernel.stub(:rand).and_return(0,1,2,3,4,5,6,7,8)
      grid = Grid.new(3)
      grid.build
      statuses = []
      shown_around = grid.show_around(1,1)
      shown_around.each { |cell| statuses << cell.status }
      statuses.should eq [0,1,2,3,5,6,7,8]
    end

    it 'inserts an array of neighbors into each cell object after the grid is built, with wrapping' do
      Kernel.stub(:rand).and_return(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
      grid = Grid.new(4)
      grid.build
      statuses = []
      shown_around = grid.show_around(0,3)
      #p shown_around
      shown_around.each { |cell| statuses << cell.status }
      statuses.should eq [14,15,12,2,0,6,7,4]
    end
  end

  context '#evolve_all' do
    it 'tells all the cells to evolve' do 
      Kernel.stub(:rand).and_return(1,0,1,0,0,0,0,1,0)
      grid = Grid.new(3)
      grid.build
      grid.give_neighbors
      grid.evolve_all
      grid.bake_all
      grid.display.should eq "1 1 1 \n1 1 1 \n1 1 1 \n"
    end
  end

  context '#stamp_pattern' do
    it 'stamps the grid with a given cell pattern, beginning at index [0][0]' do
      grid = Grid.new(5)
      grid.build
      grid.give_neighbors
      #puts grid.grid
      glider_formation = [[0,0,0,0,0],
                          [0,0,1,0,0],
                          [0,0,0,1,0],
                          [0,1,1,1,0],
                          [0,0,0,0,0]]
      grid.stamp_pattern(glider_formation,0,0)
      grid.display.should eq "0 0 0 0 0 \n0 0 1 0 0 \n0 0 0 1 0 \n0 1 1 1 0 \n0 0 0 0 0 \n"
    end

    it 'stamps the grid with a given cell pattern and offset, beginning at index [1][1]' do
      Kernel.stub(:rand).and_return(0)
      grid = Grid.new(6)
      grid.build
      grid.give_neighbors
      #puts grid.grid
      glider_formation = [[0,0,0,0,0],
                          [0,0,1,0,0],
                          [0,0,0,1,0],
                          [0,1,1,1,0],
                          [0,0,0,0,0]]
      grid.stamp_pattern(glider_formation,1,1)
      grid.display.should eq "0 0 0 0 0 0 \n0 0 0 0 0 0 \n0 0 0 1 0 0 \n0 0 0 0 1 0 \n0 0 1 1 1 0 \n0 0 0 0 0 0 \n"
    end

    it 'stamps the grid with a given cell pattern and offset, with wrapping, beginning at index [3][0]' do
      Kernel.stub(:rand).and_return(0)
      grid = Grid.new(5)
      grid.build
      grid.give_neighbors
      #puts grid.grid
      glider_formation = [[0,0,0,0,0],
                          [0,0,1,0,0],
                          [0,0,0,1,0],
                          [0,1,1,1,0],
                          [0,0,0,0,0]]
      grid.stamp_pattern(glider_formation,3,0)
      grid.display.should eq "0 0 0 1 0 \n0 1 1 1 0 \n0 0 0 0 0 \n0 0 0 0 0 \n0 0 1 0 0 \n"
    end

    it 'stamps the grid with a given cell pattern and offset, with wrapping, beginning at index [2][2]' do
      Kernel.stub(:rand).and_return(0)
      grid = Grid.new(5)
      grid.build
      grid.give_neighbors
      glider_formation = [[0,0,0,0,0],
                          [0,0,1,0,0],
                          [0,0,0,1,0],
                          [0,1,1,1,0],
                          [0,0,0,0,0]]
      grid.stamp_pattern(glider_formation,2,2)
      grid.display.should eq "1 0 0 1 1 \n0 0 0 0 0 \n0 0 0 0 0 \n0 0 0 0 1 \n1 0 0 0 0 \n"
    end

  end



end



















