class Board
  attr_reader :board
  attr_reader :winning_lines
  
  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @winning_lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]
  end

  def move(play, choice)
    return false if choice == "0"

    choice = choice.to_i
    if @board.any? choice
      if play
        @board[choice - 1] = 'X'
      else
        @board[choice - 1] = 'O'
      end
    else
      puts "enter again"
      move(play, gets.chomp)
    end
  end

  def winner?
    @winning_lines.each do |x|
      if (@board[x[0]] == 'X') && (@board[x[1]] == 'X') && (@board[x[2]] == 'X')
        return "X"
      elsif ((@board[x[0]] == 'O') && (@board[x[1]] == 'O') && (@board[x[2]] == 'O'))
        return "O"
      end
    end
    return false
  end

  def draw?
    return @board.any? (Integer)
  end
end