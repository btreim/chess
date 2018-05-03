require_relative 'pawn'

class Board
  attr_reader :cell

  def initialize
    create_cells
    create_pieces
  end

  def create_cells
    @cell = []
    0.upto(7) { |a| 0.upto(7){ |b| @cell << [a,b]}}
  end

  def create_pieces
    @cell.each do |cell|
      if cell[0] == 1 # Create Black Pawns
        cell << Pawn.new(:black)
      elsif cell[0] == 6 # Create White Pawns
        cell << Pawn.new(:white)
      end
    end
  end

  def select_all(color) #input :color
    pieces = []
    @cell.each do | cell |
      if cell.size == 3
        if cell[2].color == color
          pieces << cell
        end
      end
    end
    return pieces
  end

  def select_cell(selected)
    c = @cell.index { |cell| cell.first(2) == selected }
    unless c.nil? # Make sure selected is on the board
      return @cell[c]
    else
      []
    end
  end

  def movement_options(input) #  Takes full Array WITH PIECE OBJECT as input
    if input.size == 3 # Make sure input includes object @ index [2]
      options = []
      coordinates = input[0..1]
      piece = input[2]

      engage_move = piece.rules_of_engagement(coordinates) # find valid enagement moves according to Piece engagement rules

      engage_move.each do | move |
        engage_move_full = select_cell(move)
        if engage_move_full.size == 3  # Make sure cell is occupied by opposition (Maybe add a :color equality check)
          options << move
        end
      end

      moves = piece.rules_of_movement(coordinates) # find valid moves according to Piece movement rules

      moves.each do | move |
        move_full = select_cell(move)
        if move_full.size != 3  # Make sure move is not already occupied
          options << move
        end
      end
    else
      return []
    end
    return options
  end

  def move(current, target)
    target = select_cell(target)
    if target.size == 3 
      target[2] = current.pop
    else
      target << current.pop
    end
  end
end
# b = Board.new
# b.move([6,4],[2,4])

# # p b.cell[48]
# # b.cell.each {|cell| p cell.first(2).include?([3,0])}
# # b.movement_options([6,0])
# b.cell.each_with_index do |cell, index|
#   p "my index #{index}, #{cell}"
# end
# p b.movement_options(b.cell[20])
