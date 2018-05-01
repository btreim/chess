class Pawn
	attr_reader :color
	attr_accessor :position, :unicode

	def initialize(color, position)
		@color = color
		@position = position
		@unicode = set_unicode(color)
	end

	def move(ary)
		@position = ary
	end

	def set_unicode(color)
		color == :white ? self.unicode = "\u2659" : self.unicode = "\u265F"
	end

	def rules_of_movement
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
end
