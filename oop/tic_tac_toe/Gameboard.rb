class Gameboard
  attr_accessor :board

  def initialize(board=nil)
    @board = board || create_gameboard
  end

  def create_gameboard
    Array.new(9,"")
  end

  def add(args)
    position ,mark = args[:position], args[:mark]
    if self.board[position] == ""
      self.board[position] = mark
    else
      false
    end
  end

  def win?
    win_conditions.each do |array|
      if  self.board[array[0]] != "" && 
          self.board[array[0]] == self.board[array[1]] && 
          self.board[array[1]] == self.board[array[2]]

        return self.board[array[0]]
      end
    end
    false
  end

  def tie?
    if !self.board.include?("") && !self.win?
      return true
    else
      return false
    end
  end

  def to_s
    board_with_spaces = board.map { |e| e = e == "" ? " " : e }
    " #{board_with_spaces[0]} | #{board_with_spaces[1]} | #{board_with_spaces[2]}
---+---+---
 #{board_with_spaces[3]} | #{board_with_spaces[4]} | #{board_with_spaces[5]}
---+---+---
 #{board_with_spaces[6]} | #{board_with_spaces[7]} | #{board_with_spaces[8]}"
  end

  private
    def win_conditions
      [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    end
end

