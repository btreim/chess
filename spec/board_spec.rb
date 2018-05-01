require 'board'

describe "Board" do 
	let(:board) { Board.new }
	context "when initialized" do 
		it "creates an 8x8 grid" do 
			expect(board.cell.size).to eql(64)
		end
	end 
end

