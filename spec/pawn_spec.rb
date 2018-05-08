require 'pawn'

describe "Pawn" do
  let!(:pawn) { Pawn.new(:white)	 }
  context "when initialized" do

    it "takes a symbol as a color argument" do
      expect(pawn.color).to eql(:white)
    end

    it "correctly assigns the unicode character" do
      expect(Pawn.new(:white).unicode).to eql("\u2659")
    end
  end

  describe "#rules_of_movement" do
    context "when :white " do
      it "moving from origin returns two upward movement options" do
        expect(pawn.rules_of_movement([6,0])).to eql([[[5,0],[4,0]]])
      end

      it "moving any other space returns one upward movement option" do
        expect(Pawn.new(:white).rules_of_movement([4,0])).to eql([[[3,0]]])
      end
    end
    context "when :black " do
      let(:pawn) { Pawn.new(:black) }
      it "moving from origin returns two downward movement options" do
        expect(pawn.rules_of_movement([1,0])).to eql([[[2,0],[3,0]]])
      end

      it "moving any other space returns one downward movement option" do
        expect(Pawn.new(:black).rules_of_movement([2,0])).to eql([[[3,0]]])
      end
    end
  end

  describe "#rules_of_engagement" do
    context "when :white" do
      it "returns array of the two cells UP and to the L/R" do
        expect(Pawn.new(:white).rules_of_engagement([6,0])).to eql([[5,-1],[5,1]])
      end
    end
    context "when :black" do
      it "returns array of the two cells DOWN and to the L/R" do
        expect(Pawn.new(:black).rules_of_engagement([2,0])).to eql([[3,-1],[3,1]])
      end
    end
  end
end
