class Player
  attr_reader :name
  attr_reader :symbol

public def initialize(name, symbol)
    @name = name.to_s
    @symbol = symbol.to_s
  end
end
