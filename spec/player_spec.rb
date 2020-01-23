require './lib/player'

# Check if the input name is a string
RSpec.describe Player do
  describe "#initialize" do
    it "Player name is a string" do
      player = Player.new('X', 'Henrique')
      expect(player.initialize('Henrique', 'X').is_a? String).to eql(true)

      expect(player.initialize(1234,3667).is_a? String).to eql(true)
    end
  end
end