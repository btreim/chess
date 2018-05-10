require_relative 'board'
require 'colorize'
require 'yaml'

class Chess

  attr_accessor :board, :num
  attr_reader :checkmate, :game_id


  def initialize
    clear_screen
    home_screen
  end

  def home_screen
  	clear_screen
    print "

	        *****************
		*CHESS***********
		******CHESS******
		***********CHESS*
		******CHESS******
		*CHESS***********
		******CHESS******
		***********CHESS*
		*****************

		"
    puts "\n(1) New Game \n(2) Load Game \n(3) Exit Game"
    choice = gets.chomp
    if choice == "2"
      clear_screen
      load_file(display_saved_games)
    elsif choice == "3"
      clear_screen
      puts"\n GOODBYE!"
      exit
    else
      generate_new_game
    end
  end

  def generate_new_game
    @board = Board.new
    @checkmate = false
    @num = 0
    game_start
  end

  def display_saved_games
  	input = ""
    files = []
    Dir.glob("saved/*") { |file| files << file }
    puts "Please Select a File:"
    puts "_____________________"
    files.each_with_index do | file, index |
      puts "(#{index})#{file[/\/\w*/]}\n"
    end

    until input.match(/\d/)
      input = gets.chomp.downcase
    end
    files[input.to_i]
  end

  def load_file(selected)
    selected = File.open(selected, "r")
    file = YAML::load(selected)
    @board = file.board
    @checkmate = file.checkmate
    @num = file.num
    game_start
  end

  def save_file
    if @game_id == nil
      print "Save game as:"
      input = gets.chomp.downcase.gsub(/\s+/, "")
      @game_id = input
    end

    f = "./saved/#{@game_id}.yaml"
    File.open(f, "w+") { |file| file.write(self.to_yaml) }

    puts "...\n#{@game_id} saved!\n..."

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

  def clear_screen
    system "clear" or system "cls"
  end

  def print_status
    clear_screen
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
      clear_screen
      print_status
      turn_loop(pieces)
    end
  end

  def user_select(pieces)
    puts "Please choose one of the following options:"
    puts "Type '100' to save game"
    puts "Type '200' to quit to home screen"
    display(pieces)
    answer = gets.chomp.to_i
    if answer <= pieces.length && answer > 0
      return (answer - 1)
    elsif answer == 100
      save_file
      user_select(pieces)
    elsif answer == 200
      home_screen
    else
      user_select(pieces)
    end
    # clear_screen
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
