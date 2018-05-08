class King
  attr_reader :color, :unicode

  def initialize(color)
    @color = color
    @unicode = set_unicode(color)
  end

  def set_unicode(color)
    color == :white ? "\u2654" : "\u265A"
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

    move1 << [(position[0] + 1), position[1]]        # up
    move2 << [ position[0],      (position[1] + 1)]  # right
    move3 << [(position[0] - 1), position[1]]        # down
    move4 << [ position[0],      (position[1] - 1)]  # left
    move5 << [(position[0] - 1), (position[1] - 1)]  # Diagonally up and left
    move6 << [(position[0] - 1), (position[1] + 1)]  # Diagonally up and right
    move7 << [(position[0] + 1), (position[1] + 1)]  # Diagonally down and right
    move8 << [(position[0] + 1), (position[1] - 1)]  # Diagonally down and left

    moves << [move1,move2,move3,move4,move5,move6,move7,move8]

    return moves.flatten!(1)
  end

end
