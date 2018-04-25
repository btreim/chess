require 'board'

describe "Board" do 
	let(:board) { Board.new }
	context "when initialized" do 
		it "responds to #cells" do 
			expect(board.cells).to eql(nil)
		end
	end 
end