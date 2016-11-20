require "./Player"
require "./Gameboard"

class AI < Player
  def initialize(args)
    super(args)
  end

  def place_mark(game)
    move = find_move(game.clone)
    return move
  end
  
  def find_move(game)
    @best_move = 0
    minimax(game)
    @best_move
  end

  def minimax(game)
    board = game.board 
    player = game.active_player
    #if the game in question is over.. return it's score
    return score(board) if board.win? || board.tie?
    #scores for all possible moves are stored in a hash
    #the key is the move number and the value is the score
    scores = {}

    #for every possible next move, return the minimax score
    #it's recursive, so in essense, it plays out every possible game
    get_possible_moves(board.board).each do |move|
      possible_game = get_new_game_state(game, move)
      scores[move] = minimax(possible_game)
    end
    
    #if the game does not result in a win, it returns the game
    #that results in the best chance of a win
    #also.. sets the best_moves variable so that once the algorithm has
    #been played out the bot knows what move to make
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

    def get_new_game_state(game, move)
      new_game_state = game.clone
      new_game_state.board.add({position:move,mark:game.active_player.mark})
      new_game_state.switch_active_player
      new_game_state
    end
end