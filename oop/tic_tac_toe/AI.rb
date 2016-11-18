require "./Player"

class AI < Player
  def initialize(args)
    super(args)
  end

  def place_mark(board)
    possible_moves = []
    board.each_with_index do |e,i|
      if e == "" 
        possible_moves << i
      end
    end
    position = rand possible_moves.length
    possible_moves[position]
  end
end