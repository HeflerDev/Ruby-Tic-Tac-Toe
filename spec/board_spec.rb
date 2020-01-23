require './lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'returns a 3 by 3 grid in correct order' do
      board = Board.new
      expect(board.initialize).to match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#draw?' do
    it 'returns true if draw' do
      board = Board.new
      expect(board.draw?).to be(true)
    end

    it 'returns false if draw doesn\'t has any integer' do
      board = Board.new
      board.board = %w[O X O X X O X O X]
      expect(board.draw?).to eql(false)
    end

    it 'returns true if draw has any integer' do
      board = Board.new
      board.board = ['O', 2, 'O', 'X', 'X', 'O', 'X', 'O', 'X']
      expect(board.draw?).to eql(true)
    end
  end

  describe '#move' do
    it 'returns the right move' do
      board = Board.new
      expect(board.move(true, 1)).to eql('X')
      expect(board.move(false, 1)).to eql('O')
    end
  end
end
