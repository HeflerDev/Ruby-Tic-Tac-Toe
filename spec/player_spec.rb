require_relative '../lib/player'

# Check if the input name is a string
RSpec.describe Player do
  describe '#initialize' do
    it 'Player name is a string' do
      player = Player.new('X', 'Henrique')
      playernum = Player.new(1234, 3667)
      expect((player.name.is_a? String)).to eql(true)
      expect((playernum.name.is_a? String)).to eql(false)
    end

    it 'Player symbol is a string' do
      player = Player.new('X', 'Rey')
      expect(player.symbol.class).to eql(String)
    end
  end
end
