require "./Gameboard"

describe "Gameboard" do 
  subject(:board) {Gameboard.new}
  it "initializes an empty board" do
    expect(board.board).to eq(["","","",
                               "","","",
                               "","",""])
  end
  it "can initialize with an array" do 
    board = Gameboard.new(["X","X","X","","","","","",""])
    expect(board.board).to eql(["X","X","X","","","","","",""])
  end

  describe "add" do
    it "adds marker to the board" do 
      board.add({mark: "X", position: 0})
      expect(board.board).to eql(["X","","",
                                  "","","",
                                  "","",""])
    end
    it "returns false if space taken" do 
      board.add({mark: "X", position: 0})
      expect(board.add({mark: "X", position: 0})).to eql(false)
    end
    it "remains unchanged if space taken" do
      board.add({mark: "X", position: 0})
      expect(board.board).to eql(["X","","",
                                  "","","",
                                  "","",""])
    end
  end

  describe "win?" do 
    it "responds false when no win" do 
      expect(board.win?).to eql(false)
    end
    it "responds with winner when horizontal win" do 
      board.board = ["X","X","X",
                     "O","O","",
                     "","",""]
      expect(board.win?).to eql("X")
    end
    it "responds with winner when another horizontal win" do 
      board.board = ["X","X","",
                    "O","O","O",
                    "","",""]
      expect(board.win?).to eql("O")
    end
    it "responds with winner when diagonal win" do 
      board.board = ["O","X","",
                     "","O","",
                     "","","O"]
      expect(board.win?).to eql("O")
    end
    it "responds with winner when vertical win" do 
      board.board = ["O","X","",
                     "O","X","",
                     "O","","X"]
      expect(board.win?).to eql("O")
    end
  end

  describe "tie?" do
    it "responds false if no tie" do
      expect(board.tie?).to eql(false)
    end
    it "response true if no spaces open on board" do 
      board.board = ["X","X","O",
                     "O","X","X",
                     "X","O","O"]
      expect(board.tie?).to eql(true)
    end
    it "responds false if there's a win" do
      board.board = ["X","X","O",
                     "O","X","X",
                     "X","O","X"]
      expect(board.tie?).to eql(false)
    end
  end

  describe "to_s" do
    it "returns the board as a string" do
      expect(board.to_s).to eql("   |   |  \n---+---+---\n   |   |  \n---+---+---\n   |   |  ")
    end
    it "works when you add stuff" do 
      board.add({mark: "X", position: 0})
      expect(board.to_s).to eql(" X |   |  \n---+---+---\n   |   |  \n---+---+---\n   |   |  ")
    end
  end
end