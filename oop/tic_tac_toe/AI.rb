require "./Player"
require "./Gameboard"

class AI < Player
  def initialize(args)
    super(args)
  end

  def place_mark(game)
    move = find_move(game.clone)
    return move
    # puts "move ==== #{move}"
    # possible_moves = get_possible_moves(game.board.board)
    # possible_moves[move]
  end
  
  def find_move(game)
    @best_move = 0
    minimax(game)
    @best_move
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
      scores[move] = minimax(possible_game)
    end
    # puts scores.to_s
    if game.active_player == self
      @best_move = scores.key(scores.values.max)
      return scores.values.max
    else
      return scores.values.min
    end
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