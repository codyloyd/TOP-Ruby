require './Gameboard'
require './Player'
require './Game'
require './AI'

player1 = Player.new(name: 'Human', mark: 'X')
player2 = AI.new(name: 'bot', mark: 'O')
board = Gameboard.new
game = Game.new(board: board, player1: player1, player2: player2)

def get_game_move(game)
  if game.active_player.is_a? AI
    game.active_player.place_mark(game)
  else
    input = gets.chomp
    if (0..8).cover?(input.to_i)
      input.to_i
    else
      puts 'oops, try again'
      get_game_move(game)
    end
  end
end

system 'clear'
puts 'HI! Let\'s play Tic-Tac-Toe'
puts board.to_s

until board.win? || board.tie?
  puts "It is #{game.active_player.name}\'s turn."
  guess = get_game_move(game.clone)
  system 'clear'
  if board.add(mark: game.active_player.mark, position: guess)
    puts board.to_s
    game.switch_active_player
  else
    puts 'that space seems to be taken'
  end
end

if board.win?
  system 'clear'
  puts board.to_s
  puts "Congratulations #{game.winner.name}! You Win!"
end

if board.tie?
  puts board.to_s
  puts 'Looks like it was a tie!'
end
