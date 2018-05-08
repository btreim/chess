class Rook
  attr_reader :color, :unicode

  def initialize(color)
    @color = color
    @unicode = set_unicode(color)
  end

  def set_unicode(color)
    color == :white ? "\u2656" : "\u265C"
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

      move1 << [(position[0] + x), position[1]]        # up
      move2 << [ position[0],      (position[1] +  y)] # right
      move3 << [(position[0] - x), position[1]]        # down
      move4 << [ position[0],      (position[1] -  y)] # left

      x += 1
      y += 1
    end

    moves << [move1,move2,move3,move4]

    return moves.flatten!(1)
  end

end
