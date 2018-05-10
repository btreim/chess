require 'chess'


describe 'Chess' do
  let(:chess) { Chess.new }
  
  describe 'Check' do
  	before do
      chess.board.move((chess.board.cell[57]), (chess.board.cell[21]))
      chess.board.move((chess.board.cell[11]), (chess.board.cell[19]))
  	end
  	 let(:new_pos) { chess.board.cell[21] }

    it "Notifys when in CHECK" do
      expect(chess.check_future(chess.board.movement_options(new_pos))).to eql(false)
    end
    	
    
  end

  describe 'CheckMate' do
     
  	before do
      chess.board.move((chess.board.cell[57]), (chess.board.cell[21]))
  	end
  	 let(:new_pos) { chess.board.cell[21] }

    it "quits the game when in CheckMate" do
      expect(chess.check_future(chess.board.movement_options(new_pos))).to eql(true)
    end
  end


end
