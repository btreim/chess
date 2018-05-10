require_relative 'board'
require 'colorize'

class Chess

  attr_accessor :board, :num
  attr_reader :checkmate

  def initialize
    @board = Board.new
    @checkmate = false
    @num = 0
  end

  def game_start
    until @checkmate == true
      print_status
      white_turn
      print_status
      black_turn
      print_status
    end
  end

  def print_status
    system "clear" or system "cls"
    puts "   0    1    2    3    4    5    6    7"
    (8).times do
      puts  " +----+----+----+----+----+----+----+----+"
      print "   #{print_cell}    #{print_cell}    #{print_cell}    #{print_cell}    #{print_cell}    #{print_cell}    #{print_cell}    #{print_cell}"
      print "\n"
    end
    @num = 0
  end


  def print_cell

    if @board.cell[@num].size == 3
      print = @board.cell[@num][2].unicode
    else
      print = " "
    end
    @num += 1
    return print
  end

  def white_turn
    pieces = board.select_all(:white)
    turn_loop(pieces)
  end


  def black_turn
    pieces = board.select_all(:black)
    turn_loop(pieces)
  end

  def check_future(future_moves)
    future_moves.each do | move |
      move = board.select_cell(move)
      if move.size == 3 && move[2].class == King
        if board.movement_options(move).empty? #Check to see if king is blocked
          @checkmate = true
          print_status
          puts "**CHECKMATE - GAME OVER**"
          exit
        else
          puts "**CHECK**}"
        end
      end
    end
    @checkmate
  end

  def turn_loop(pieces)
    selection = user_select(pieces)
    move_option = board.movement_options(pieces[selection])
    if move_option.empty? == false # There are movement options
      move_selection = user_select(move_option)
      new_pos = board.move(pieces[selection],move_option[move_selection])
      check_future(board.movement_options(new_pos))
    else
      turn_loop(pieces)
    end
  end

  def user_select(pieces)
    puts "Please choose one of the following options:"
    display(pieces)
    answer = gets.chomp.to_i
    if answer <= pieces.length && answer > 0
      return (answer - 1)
    else
      user_select(pieces)
    end
  end

  def display(pieces)
    num = 1
    pieces.each do | piece |
      if piece.size > 2
        p "#{num}: #{piece[0..1]} -- #{piece[2].unicode}"
      elsif piece.size == 2
        p "#{num}: #{piece}"
      end
      num += 1
    end
  end
end


c = Chess.new
c.game_start
