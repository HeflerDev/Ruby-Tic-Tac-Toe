#!/usr/bin/env ruby

# rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity,Metrics/LineLength
require_relative '../lib/player.rb'

require_relative '../lib/board.rb'

def instructions
  puts 'Do you need instructions?Y/N'
  x = gets.chomp.downcase
  puts 'The game consists of a 3x3 board and each player, alternately, play "X" or "O", with the objective of completing a vertical, horizontal or diagonal line. In each turn, the current player choose one of the squares enumerated from 1 to 9, and passes the turn to the next player who has to choose an avaiable square to make it\'s move.' if x == 'y'
end

def showboard(board)
  puts '╔═══╦═══╦═══╗'
  puts "║ #{board.board[0]} ║ #{board.board[1]} ║ #{board.board[2]} ║"
  puts '╠═══╬═══╬═══╣'
  puts "║ #{board.board[3]} ║ #{board.board[4]} ║ #{board.board[5]} ║"
  puts '╠═══╬═══╬═══╣'
  puts "║ #{board.board[6]} ║ #{board.board[7]} ║ #{board.board[8]} ║"
  puts '╚═══╩═══╩═══╝'
end

def clear_screen
  system('clear')
end

def check_move(play, choice, board)
  return false if choice == '0'

  choice = choice.to_i
  if board.board.any? choice
    board.move(play, choice)
  else
    puts 'enter again'
    check_move(play, gets.chomp, board)
  end
end

def play
  instructions
  puts "\nType player one name(The 'X')"
  player_one = Player.new(gets.chomp.capitalize, 'X')
  puts "\nType player two name(The 'O')"
  p2_name = gets.chomp.capitalize
  while p2_name == player_one.name
    puts 'Your name is the same as player one, choose another'
    p2_name = gets.chomp.capitalize
  end
  player_two = Player.new(p2_name, 'X')
  board = Board.new
  puts "Hello #{player_one.name} and #{player_two.name} let's start"
  puts showboard(board)
  play = true
  loop do
    if play
      puts "#{player_one.name}, choose a square number"
    else
      puts "#{player_two.name}, choose a square number"
    end
    choice = gets.chomp
    break unless check_move(play, choice, board)

    play = !play
    clear_screen
    showboard(board)
    winner = board.winner?
    if winner
      if winner == 'X'
        puts "You're the winner #{player_one.name}"
      else
        puts "You're The winner #{player_two.name}"
      end
      break
    end
    unless board.draw?
      puts 'Game Draw'
      break
    end
  end
end
loop do
  play
  puts 'Game Over, terminating'
  puts 'Play Again?Y/N'
  pa = gets.chomp.downcase
  break if pa != 'y'
end
# rubocop:enable Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity,Metrics/LineLength
