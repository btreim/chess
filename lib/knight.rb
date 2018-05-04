class Knight
  attr_reader :color, :unicode

  def initialize(color)
    @color = color
    @unicode = set_unicode(color)
  end

  def set_unicode(color)
    color == :white ? "\u2658" : "\u265E"
  end

  def rules_of_movement(position)
    moves = []

    move_1 = [(position[0] + 2 ), (position[1] + 1)] # Up and to the right
    move_2 = [(position[0] + 2 ), (position[1] - 1)] # Up and to the left
    move_3 = [(position[0] - 2 ), (position[1] + 1)] # Down and to the right
    move_4 = [(position[0] - 2 ), (position[1] - 1)] # Down and to the left
    move_5 = [(position[0] + 1 ), (position[1] + 2)] # Right and to the right
    move_6 = [(position[0] - 1 ), (position[1] + 2)] # Right and to the left
    move_7 = [(position[0] + 1 ), (position[1] - 2)] # Left and to the right
    move_8 = [(position[0] - 1 ), (position[1] - 2)] # Left and to the left

    moves = [move_1, move_2, move_3, move_4, move_5, move_6, move_7, move_8]
    return moves
  end

  def rules_of_engagement(position)
    rules_of_movement(position) # No seperate engagement rules
  end
end
