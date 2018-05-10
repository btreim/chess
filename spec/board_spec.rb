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
    #
  end

  describe "#move" do
    it "it uses a 'current' and 'target' array to move cells" do
      expect(board.move([6,7],[4,7])).to eql(board.cell[39])
    end
  end


  describe "#movement_options" do

    describe 'Pawn' do
      it "returns array of possible" do
        expect(board.movement_options(board.cell[15])).to eql([[3,7], [2,7]])
      end
      before do
        board.move((board.cell[9]), (board.cell[47]))
      end
      it "follows rules of engagement" do
        expect(board.movement_options(board.cell[47])).to eql([[6,6]])
      end
    end

    describe 'Knight' do
      before do
        board.move((board.cell[6]), (board.cell[36]))
      end
      it "returns array of possible" do
        expect(board.movement_options(board.cell[36])).to eql([[3, 2], [5, 2], [3, 6], [5, 6], [2, 3], [2, 5], [6, 3], [6, 5]])
      end
    end

    describe 'Bishop' do
      before do
        board.move((board.cell[58]), (board.cell[36]))
      end
      it "returns array of possible" do
        expect(board.movement_options(board.cell[36])).to eql([[2, 2], [3, 3], [2, 6], [3, 5], [5, 5], [5, 3]])
      end
    end

    describe 'Rook' do
      before do
        board.move((board.cell[56]), (board.cell[36]))
      end
      it "returns array of possible" do
        expect(board.movement_options(board.cell[36])).to eql([[5, 4], [4, 7], [4, 6], [4, 5], [2, 4], [3, 4], [4, 0], [4, 1], [4, 2], [4, 3]])
      end
    end

    describe 'Queen' do
      before do
        board.move((board.cell[59]), (board.cell[36]))
      end
      it "returns array of possible" do
        expect(board.movement_options(board.cell[36])).to eql([[5, 4], [4, 7], [4, 6], [4, 5], [2, 4], [3, 4], [4, 0], [4, 1], [4, 2], [4, 3], [2, 2], [3, 3], [2, 6], [3, 5], [5, 5], [5, 3]])
      end
    end

    describe 'King' do
      before do
        board.move((board.cell[4]), (board.cell[36]))
      end
      it "returns array of possible" do
        expect(board.movement_options(board.cell[36])).to eql([[5, 4], [4, 5], [3, 4], [4, 3], [3, 3], [3, 5], [5, 5], [5, 3]])
      end
    end
  end
end
