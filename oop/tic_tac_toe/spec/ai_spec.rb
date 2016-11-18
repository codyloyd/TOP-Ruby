require "./AI"

describe "AI" do 
  subject(:ai) {AI.new({name:"bot",mark:"X"})}  
  it "inheritance works" do 
    expect(ai.name).to eql("bot")
  end

  describe "place_mark" do
    it "places mark in empty array" do 
      board = ["","","","","","","","","",]
      expect([0,1,2,3,4,5,6,7,8]).to include(ai.place_mark(board))
    end
    it "places mark in array with stuff in it" do
      board = ["X","X","X","X","","","","","",]
      100.times { expect([4,5,6,7,8]).to include(ai.place_mark(board)) }
    end 
  end
end