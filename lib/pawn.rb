class Pawn
  attr_reader :color, :unicode


  def initialize(color)
    @color = color
    @unicode = set_unicode(color)
  end

  def set_unicode(color)
    color == :white ? "\u2659" : "\u265F"
  end

  def rules_of_movement(position)
    moves = []

    if color == :white
      if position[0] == 6 # Pawn hasn't moved from origin
        moves << move_f_1 = [ (position[0] - 1), position[1] ] # Move up one space
        moves << move_f_2 = [ (position[0] - 2), position[1] ] # Move up two
      else
        moves << move_f_1 = [ (position[0] - 1), position[1] ] # Move up one space
      end
    elsif color == :black
      if position[0] == 1 # Pawn hasn't moved from origin
        moves << move_f_1 = [ (position[0] + 1), position[1] ] # Move down one space
        moves << move_f_2 = [ (position[0] + 2), position[1] ] # Move down two
      else
        moves << move_f_1 = [ (position[0] + 1), position[1] ] # Move down one space
      end
    end
    return moves
  end

  def rules_of_engagement(position)
    opponent = []

    if color == :white
      opponent << engage_l = [ (position[0] - 1), (position[1] - 1) ] # Up and to the left
      opponent << engage_r = [ (position[0] - 1), (position[1] + 1) ] # Up and to the left
    elsif color == :black
      opponent << engage_l = [ (position[0] + 1), (position[1] - 1) ] # Down and to the left
      opponent << engage_r = [ (position[0] + 1), (position[1] + 1) ] # Down and to the left
    end
    return opponent
  end
end
