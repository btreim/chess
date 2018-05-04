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

    x = 1
    y = 1

    until x == 8
      moves << [(position[0] + x), (position[1] + y)] # Diagonally down and right
      moves << [(position[0] - x), (position[1] - y)] # Diagonally up and left
      moves << [(position[0] + x), (position[1] -  y)] # Diagonally down and left
      moves << [(position[0] - x), (position[1] +  y)] # Diagonally up and right
      x += 1
      y += 1
    end
    return moves
  end

  def rules_of_engagement(position)
    rules_of_movement(position) # No seperate engagement rules
  end
end
