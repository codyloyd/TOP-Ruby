require "./Game"

describe "Game" do
  player1 = Player.new({name:"player1",mark:"X"}) 
  player2 = Player.new({name:"player2",mark:"O"})
  board = Gameboard.new 
  subject(:game) { Game.new({player1:player1,player2:player2,board:board})}
  describe "set_initial_player" do
    it "returns a player" do
      expect(game.set_initial_player(player1,player2)).to be_a(Player)
    end
  end

  describe "switch_active_player" do 
    before do
      game.active_player = player1
      game.switch_active_player
    end
    it "changes which player is active" do
      expect(game.active_player).to eql(player2)
    end
  end

  describe "winner" do 
    it "returns the right winner" do 
      board.board = ["X","X","X",
                     "O","O","",
                     "","",""]
      expect(game.winner).to eql(player1)                    
    end
    it "returns the right with O" do 
      board.board = ["X","X","",
                     "O","O","O",
                     "","",""]
      expect(game.winner).to eql(player2)                    
    end
  end
end