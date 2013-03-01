class Pattern
  attr_reader :form
  def initialize(type)
    @form = change_form(type)
  end

  def change_form(new_type)
    case new_type
    when :glider
      @form = [[0,0,0,0,0],
               [0,0,1,0,0],
               [0,0,0,1,0],
               [0,1,1,1,0],
               [0,0,0,0,0]]
    when :figure_eight
      @form =  [[0,0,0,0,0,0,0,0],
                [0,1,1,1,0,0,0,0],
                [0,1,1,1,0,0,0,0],
                [0,1,1,1,0,0,0,0],
                [0,0,0,0,1,1,1,0],
                [0,0,0,0,1,1,1,0],
                [0,0,0,0,1,1,1,0],
                [0,0,0,0,0,0,0,0]]
    end
  end



  def rotate_left
    @form.transpose.reverse
  end

  def rotate_right
    @form.reverse.transpose
  end

  def rotate_180
    @form.transpose.reverse.transpose.reverse
  end

  def flip_horizontal
    @form.map {|row| row.reverse}
  end

  def flip_vertical
    @form.reverse
  end

end

 [[0,0,0,0,0,0,0,0],
  [0,1,1,1,0,0,0,0],
  [0,1,1,1,0,0,0,0],
  [0,1,1,1,0,0,0,0],
  [0,0,0,0,1,1,1,0],
  [0,0,0,0,1,1,1,0],
  [0,0,0,0,1,1,1,0],
  [0,0,0,0,0,0,0,0]]