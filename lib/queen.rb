class Queen
  attr_reader :color, :unicode

  def initialize(color)
    @color = color
    @unicode = set_unicode(color)
  end

  def set_unicode(color)
    color == :white ? "\u2655" : "\u265B"
  end

  def rules_of_movement(position)
    moves = []
    move1 = []
    move2 = []
    move3 = []
    move4 = []
    move5 = []
    move6 = []
    move7 = []
    move8 = []
    
    x = 1
    y = 1

    until x == 7

      move1 << [(position[0] + x), position[1]]        # up
      move2 << [ position[0],      (position[1] + y)]  # right
      move3 << [(position[0] - x), position[1]]        # down
      move4 << [ position[0],      (position[1] - y)]  # left
      move5 << [(position[0] - x), (position[1] - y)]  # Diagonally up and left
      move6 << [(position[0] - x), (position[1] + y)]  # Diagonally up and right
      move7 << [(position[0] + x), (position[1] + y)]  # Diagonally down and right
      move8 << [(position[0] + x), (position[1] - y)]  # Diagonally down and left

      x += 1
      y += 1
    end

    moves << [move1,move2,move3,move4,move5,move6,move7,move8]

    return moves.flatten!(1)
  end

end
