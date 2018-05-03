require_relative 'board'

class Chess

  attr_accessor :board
  attr_reader :checkmate

  def initialize
    @board = Board.new
    @checkmate = false
    game_start
  end

  def game_start
    # until checkmate
    white_turn
    black_turn
    print_status
  end

  def print_status
    board.cell.each_with_index do |cell, index|
      p "Index #{index}, #{cell}"
    end
  end

  def white_turn
    pieces = board.select_all(:white)
    turn_loop(pieces)
  end


  def black_turn
    pieces = board.select_all(:black)
    turn_loop(pieces)
  end

  def turn_loop(pieces)
    selection = select_piece(pieces)
    move_option = board.movement_options(pieces[selection])
    move_selection = select_piece(move_option)
    board.move(pieces[selection],move_option[move_selection])
  end

  def select_piece(pieces)
    puts "Please choose one of the following options:"
    display(pieces)
    answer = gets.chomp.to_i
    return (answer - 1)
  end

  def display(pieces)
    num = 1
    pieces.each do | piece |
      if piece.size > 2
        p "#{num}: #{piece[0..1]} -- #{piece[2].unicode}"
      else
        p "#{num}: #{piece}"
      end
      num += 1
    end
  end


end


c = Chess.new
c.game_start
