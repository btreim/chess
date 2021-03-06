require_relative 'pawn'
require_relative 'knight'
require_relative 'bishop'
require_relative 'rook'
require_relative 'queen'
require_relative 'king'

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
      elsif cell == [7,1] || cell == [7,6]
        cell << Knight.new(:white)
      elsif cell == [0,1] || cell == [0,6]
        cell << Knight.new(:black)
      elsif cell == [7,2] || cell == [7,5]
        cell << Bishop.new(:white)
      elsif cell == [0,2] || cell == [0,5]
        cell << Bishop.new(:black)
      elsif cell == [7,0] || cell == [7,7]
        cell << Rook.new(:white)
      elsif cell == [0,0] || cell == [0,7]
        cell << Rook.new(:black)
      elsif cell == [7,3]
        cell << Queen.new(:white)
      elsif cell == [0,3]
        cell << Queen.new(:black)
      elsif cell == [7,4]
        cell << King.new(:white)
      elsif cell == [0,4]
        cell << King.new(:black)
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

  def movement_options(input)
    options = []
    coordinates = input[0..1]
    piece = input[2]

    moves = piece.rules_of_movement(coordinates)
    moves.each do | move_ary |
      move_ary.reverse! # Look at furthest cell first
      num = 0
      move_ary.each_with_index do | move, index |
        move_full = select_cell(move)
        if piece.class == Knight && move_full.size != 3 && @cell.include?(move_full[0..1]) != false  # Add move If called on a Knight, friendly piece doesn't occupy space, and on board
          options << move
        elsif piece.class == Knight && move_full.size == 3 && move_full[2].color != piece.color # Add move If called on a Knight and opponent occupies space
          options << move
        elsif @cell.include?(move_full[0..1]) == false # drop move if off board
          num = (index + 1)
        elsif move_full.size == 3 && move_full[2].color == piece.color # drop move inclusively if friendly occupies space
          num = (index + 1)
        elsif move_full.size == 3 && move_full[2].color != piece.color # drop move non-inclusively if opponent occupies space
          num = index
        end
      end

      if piece.class != Knight # don't duplicate the move array if called on Knight
        move_ary = move_ary.drop(num)
        move_ary.each { | move | options << move }
      end
    end

    if piece.class == Pawn
      engage_move = piece.rules_of_engagement(coordinates) # find valid enagement moves according to Piece engagement rules
      engage_move.each do | move |
        engage_move_full = select_cell(move)
        if engage_move_full.size == 3 && engage_move_full[2].color != piece.color  # Add move if occupied by opponent
          options << move
        end
      end
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
    target
  end


end
# b = Board.new

# # p b.cell[48]
# # # b.cell.each {|cell| p cell.first(2).include?([3,0])}
# # # b.movement_options([6,0])
# b.move((b.cell[1]), (b.cell[36]))
# 	b.cell.each_with_index do |cell, index|
# 	  p "my index #{index}, #{cell}"
# 	end

# p b.movement_options(b.cell[36])
