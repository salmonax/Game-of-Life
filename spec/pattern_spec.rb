require 'spec_helper'

describe Pattern do
  context '#form' do
    it 'returns the multi dimensional array with the form of the pattern' do
      glider = Pattern.new(:glider)
      glider.form.should eq [[0,0,0,0,0],[0,0,1,0,0],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,0,0]]
    end
  end

  context '#rotate_left' do
    it 'returns an arrray that rotates the pattern 90 degrees counter-clockwise' do
      glider = Pattern.new(:glider)
      glider.rotate_left.should eq [[0,0,0,0,0],[0,0,1,1,0],[0,1,0,1,0],[0,0,0,1,0],[0,0,0,0,0]]
    end
  end

  context '#rotate_180' do
    it 'returns an arrray that rotates the pattern 180 degrees' do
      glider = Pattern.new(:glider)
      glider.rotate_180.should eq [[0,0,0,0,0],[0,1,1,1,0],[0,1,0,0,0],[0,0,1,0,0],[0,0,0,0,0]]
    end
  end

  context '#rotate_right' do
    it 'returns an arrray that rotates the pattern 90 degrees clockwise' do
      glider = Pattern.new(:glider)
      glider.rotate_right.should eq [[0,0,0,0,0],[0,1,0,0,0],[0,1,0,1,0],[0,1,1,0,0],[0,0,0,0,0]]
    end
  end

  context '#flip_horizontal' do
    it 'returns an arrray that flips the pattern horizontally' do
      glider = Pattern.new(:glider)
      glider.flip_horizontal.should eq [[0,0,0,0,0],[0,0,1,0,0],[0,1,0,0,0],[0,1,1,1,0],[0,0,0,0,0]]
    end
  end

  context '#flip_vertical' do
    it 'returns an arrray that flips the pattern vertically' do
      glider = Pattern.new(:glider)
      glider.flip_vertical.should eq [[0,0,0,0,0],[0,1,1,1,0],[0,0,0,1,0],[0,0,1,0,0],[0,0,0,0,0]]
    end
  end

end