class Bishop
  attr_reader :color, :unicode

  def initialize(color)
    @color = color
    @unicode = set_unicode(color)
  end

  def set_unicode(color)
    color == :white ? "\u2657" : "\u265D"
  end

  def rules_of_movement(position)
    moves = []
    move1 = []
    move2 = []
    move3 = []
    move4 = []
    x = 1
    y = 1

    until x == 7

      move1 << [(position[0] - x), (position[1] - y)] # Diagonally up and left
      move2 << [(position[0] - x), (position[1] +  y)] # Diagonally up and right            
      move3 << [(position[0] + x), (position[1] + y)] # Diagonally down and right
      move4 << [(position[0] + x), (position[1] -  y)] # Diagonally down and left

      x += 1
      y += 1
    end

    moves << [move1,move2,move3,move4]

    return moves.flatten!(1)
  end

end
