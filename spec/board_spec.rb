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

  describe "#move" do
    it "it uses a 'current' and 'target' array to move cells" do
      expect(board.move([6,7],[4,7])).to eql(board.cell[39])
    end
  end

  describe "#movement_options" do
    context "when given input outside of board" do
      it "returns an empty array" do
        expect(board.movement_options([-1,023423])).to eql([])
      end
    end

    context "when only given coordinates" do
      it "returns an empty array" do
        expect(board.movement_options([0,0])). to eql([])
      end
    end

    context "when given full array with Piece object" do
      it "correctly follows #rules_of_movement" do
        expect(board.movement_options(board.cell[48])).to eql([[5,0],[4,0]])
      end
    end

    context "when in position to enage opponent" do
      before do
        board.move(board.cell[52],[2,4])
      end
      it "correctly displays movement options" do
        expect(board.movement_options(board.cell[20])).to eql([[1,3],[1,5]])
      end
    end
  end
end
