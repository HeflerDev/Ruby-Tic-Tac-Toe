require './lib/board'

RSpec.describe Board do
  describe "#initialize" do
    it 'returns a 3 by 3 grid in correct order' do
      board = Board.new
      expect(board.initialize).to match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "#draw?" do
    it 'returns true if draw' do
      board = Board.new
      expect(board.draw?).to be(true)
    end

    it 'returns false if draw is invalid' do
      board = Board.new
      expect(board.draw?).to_not be(false)
    end
  end

  describe "#move" do
    it 'returns the right move' do
      board = Board.new
      expect(board.move(true,1)).to eql("X")
      expect(board.move(false,1)).to eql("O")
    end
  end
end