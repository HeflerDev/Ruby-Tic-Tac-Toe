require './lib/board'

RSpec.describe Board do
  describe "#initialize" do
    it 'returns a 3 by 3 grid in correct order' do
      board = Board.new
      expect(board.initialize).to match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end