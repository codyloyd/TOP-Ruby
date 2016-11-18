require "./Player"

describe "Player" do 
  subject(:player) { Player.new({name:"Cody",mark:"X"})}
  
  describe "name" do 
    it "returns a name" do 
      expect(player.name).to eql("Cody")
    end
  end

  describe "mark" do 
    it "returns a mark" do
      expect(player.mark).to eql("X")
    end
  end
end