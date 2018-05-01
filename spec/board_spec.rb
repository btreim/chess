require 'board'

describe "Board" do 
	let(:board) { Board.new }
	describe "when initialized" do 

		it "creates an 8x8 grid" do 
			expect(board.cell.size).to eql(64)
		end

		it "positions :black pawns at row 2" do
			expect(board.cell[8][2]).to be_an_instance_of(Pawn)
		end	
		
		it "positions :white pawns at row 7" do
			expect(board.cell[48][2]).to be_an_instance_of(Pawn)
		end
	
	end
end

	