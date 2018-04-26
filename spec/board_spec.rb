require 'board'

describe "Board" do 
	let(:board) { Board.new }
	context "when initialized" do 
		it "it creates an 8x8 grid" do 
			expect(board.board[0][7]).to eql(" ")
		end
	end 
end

