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
      shown_around.each { |cell| statuses << cell.status }
      statuses.should eq [14,15,12,2,0,6,7,4]
    end
  end

  context 'give_neighbors'

end