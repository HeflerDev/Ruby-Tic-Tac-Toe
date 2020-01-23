class Player
  attr_reader :name
  attr_reader :symbol

  public def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
