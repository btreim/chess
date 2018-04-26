class Board
	attr_accessor :board

	def initialize
		height = 8
		width = 8
		# pawn = "\u2654"
		@board = Array.new(height) { Array.new(width," #{pawn} ") }
	end

end




b = Board.new
b.board.each {|line| puts line.join}