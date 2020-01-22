#!/usr/bin/env ruby

def showboard(board)
  puts '╔═══╦═══╦═══╗'
  puts "║ #{board[0]} ║ #{board[1]} ║ #{board[2]} ║"
  puts '╠═══╬═══╬═══╣'
  puts "║ #{board[3]} ║ #{board[4]} ║ #{board[5]} ║"
  puts '╠═══╬═══╬═══╣'
  puts "║ #{board[6]} ║ #{board[7]} ║ #{board[8]} ║"
  puts '╚═══╩═══╩═══╝'
end

# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
def winner?(board, winning_lines, player_one_name, player_two_name)
  winning_lines.each do |x|
    if (board[x[0]] == 'X') && (board[x[1]] == 'X') && (board[x[2]] == 'X')
      puts "#{player_one_name} you Win"
      return true
    elsif (board[x[0]] == 'O') && (board[x[1]] == 'O') && (board[x[2]] == 'O')
      puts "#{player_two_name} you Win"
      return true
    end
  end
  false
end
# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
winning_lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

puts "Type player one name(The 'X')"
player_one_name = gets.chomp

puts "Type player two name(The 'O')"
player_two_name = gets.chomp
puts 'Validating names'
puts showboard(board)
play = true
loop do
  if play
    puts "#{player_one_name}, choose a square number"
  else
    puts "#{player_two_name}, choose a square number"
  end
  choice = gets.chomp
  loop do
    choice = choice.to_i
    if board.any? choice
      board[choice - 1] = if play
                            'X'
                          else
                            'O'
                          end
      break
    else
      puts 'Invalid play choose a square number'
      choice = gets.chomp
    end
  end
  play = !play
  puts showboard(board)
  break if winner?(board, winning_lines, player_one_name, player_two_name)

  unless board.any?(Integer)
    puts 'Draw, nobody wins'
    break
  end
end
puts 'Game Over, terminating'
