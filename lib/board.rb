class Board
	attr_reader :cell

	def initialize
		create_cells
	end

	def create_cells
		@cell = []
		0.upto(7) { |a| 0.upto(7){ |b| @cell << [a,b]}}
	end

end
