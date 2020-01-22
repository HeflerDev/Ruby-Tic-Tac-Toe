#!/usr/bin/env ruby

# rubocop:disable Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
require '../lib/player.rb'

require '../lib/board.rb'

def instructions
  puts 'If you want to stop playing in your turn select 0'
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
  puts "Type player one name(The 'X')"
  player_one = Player.new(gets.chomp.capitalize, 'X')
  puts "Type player two name(The 'O')"
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
# rubocop:enable Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
