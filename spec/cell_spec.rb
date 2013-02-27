require 'spec_helper'

describe Cell do 
  context '#status' do 
    it 'initializes with cordinates and life status' do 
      cell = Cell.new(1,1)
      cell.status.should eq 0
    end
  end
  context '#switch' do 
    it 'should switch life status' do
      cell = Cell.new(1,1)
      cell.switch
      cell.status.should eq 1
    end
  end

  context '#add_neighbor' do
    it 'should add a neighbor cell to an array in a cell' do
      cell = Cell.new(1,1)
      cell_neighbor = Cell.new(1,2)
      cell.add_neighbors([cell_neighbor]).should eq [cell_neighbor]

    end
  end

  # context '#count_alive' do 
  #   it 'should add the number of alive neighbors' do 
  #     Kernel.stub(:rand).and_return(0,0,1,0,0,0,1,0,0)
  #     cell = Cell.new
  #     cell.add_neighbors([Cell.new(0,0), Cell.new(0,0), Cell.new(0,0), Cell.new(0,0), Cell.new(0,0), Cell.new(0,0), Cell.new(0,0), Cell.new(0,0), Cell.new(0,0)])
  #     cell.count_alive.should eq 2
  #   end
  # end
  # context '#evolve' do 
  #   it 'checks its neighbors for life status and changes accordingly' 
  #     cell = Cell.new(1,1)
  #     neighbors_array
  #     test_board = [[0,0,0],
  #                   [0,0,0],
  #                   [0,0,0]]
  #     3.times do |x|
  #       3.times do |y|
  #         next if x == 1 && y == 1
  #         neighbors_array << Cell.new(x,y,test_board[x][y])        
  #       end
  #     end
  #     cell.add_neighbors(neighbors_array)
end
  
