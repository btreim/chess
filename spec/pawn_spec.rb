require 'pawn'

describe "Pawn" do 
	let!(:pawn) { Pawn.new(:white,[6,0])	 }
	context "when initialized" do

		it "takes a symbol as a color argument" do 
			expect(pawn.color).to eql(:white)
		end

		it "takes an array as a position argument" do 
			expect(pawn.position).to eql([6,0])
		end

		it "correctly assigns the unicode character" do 
			expect(Pawn.new(:white,[2,0]).unicode).to eql("\u2659")
		end
	end

	context "when given new position" do
		it "it #moves" do
			expect(pawn.move([0,0])).to eql(pawn.position	)
		end
	end 

	describe "#rules_of_movement" do 
		context "when :white " do 
			it "moving from origin returns two upward movement options: [5,0][4,0]" do 
				expect(pawn.rules_of_movement).to eql([[5,0],[4,0]])
			end

			it "moving any other space returns one upward movement option" do 
				expect(Pawn.new(:white,[4,0]).rules_of_movement).to eql([[3,0]])
			end			
		end
		context "when :black " do
		let(:pawn) { Pawn.new(:black,[1,0]) } 
			it "moving from origin returns two downward movement options: [2,0][3,0]" do 
				expect(pawn.rules_of_movement).to eql([[2,0],[3,0]])
			end

			it "moving any other space returns one downward movement option" do 
				expect(Pawn.new(:black,[2,0]).rules_of_movement).to eql([[3,0]])
			end
		end
	end
end
