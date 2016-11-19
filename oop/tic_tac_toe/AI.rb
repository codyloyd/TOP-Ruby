require "./Player"
require "./Gameboard"

class AI < Player
  def initialize(args)
    super(args)
  end

  def place_mark(game)
    move = minimax(game)
    possible_moves = get_possible_moves(game.board.board)
    possible_moves[move]
  end
  
  def minimax(game)
    board = game.board 
    player = game.active_player
    return score(board) if board.win? || board.tie?
    scores = {}

    get_possible_moves(board.board).each do |move|
      possible_game = game.clone
      possible_game.board.add({position:move,mark:player.mark})
      possible_game.switch_active_player
      puts possible_game.board.to_s
      puts ""
      scores[move] = minimax(possible_game)
    end

    if game.active_player == self
      return scores.key(scores.max)
    else
      return scores.key(scores.min)
    end
    # if not self return the lowest score
    puts scores.to_s
  end

  private
    def get_possible_moves(board)
      possible_moves = []
      board.each_with_index do |e,i|
        if e == "" 
          possible_moves << i
        end
      end
      possible_moves
    end

    def score(board)
      if board.win? == self.mark
        10
      elsif board.tie?
        0
      else
        -10
      end
    end
end