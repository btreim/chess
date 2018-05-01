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
				cell << Pawn.new(:black,([cell[0],cell[1]]))
			elsif cell[0] == 6 # Create White Pawns
				cell << Pawn.new(:white,([cell[0],cell[1]]))
			end
		end
	end

end

b = Board.new

b.cell.each_with_index do |cell, index|
	puts "This is the cell: #{cell} and this is the index #{index}"
end

# p b.cell[2][1]