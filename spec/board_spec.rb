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
    it 'returns array of possible for Pawn' do
      expect(board.movement_options(board.cell[48])).to eql([[4,0],[5,0]])
    end

    it 'returns array of possible for Knight' do
      expect(board.movement_options(board.cell[57])).to eql([[5,0],[5,2]])
    end

    it 'returns array of possible for Bishop' do
      expect(board.movement_options(board.cell[61])).to eql([])
    end

  end
end
