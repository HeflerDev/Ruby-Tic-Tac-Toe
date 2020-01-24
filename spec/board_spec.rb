require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'returns a 3 by 3 grid in correct order' do
      expect(board.board).to match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#draw?' do
    it 'returns true if draw' do
      expect(board.draw?).to be(true)
    end

    it 'returns false if draw doesn\'t has any integer' do
      board.board = %w[O X O X X O X O X]
      expect(board.draw?).to eql(false)
    end

    it 'returns true if draw has any integer' do
      board.board = ['O', 2, 'O', 'X', 'X', 'O', 'X', 'O', 'X']
      expect(board.draw?).to eql(true)
    end
  end

  describe '#move' do
    it 'returns the right move' do
      expect(board.move(true, 1)).to eql('X')
      expect(board.move(false, 1)).to eql('O')
    end
  end

  describe '#winner?' do
    it 'Check if the "X" has win on the first line' do
      board.board = ['X', 'X', 'X', 'O', 'O', 6, 7, 'O', 9]
      expect(board.winner?).to eql('X')
    end

    it 'Check if the "Y" has win on the cross line' do
      board.board = ['X', 2, 'O', 4, 'O', 'X', 'O', 'X', 9]
      expect(board.winner?).to eql('O')
    end
  end
end
