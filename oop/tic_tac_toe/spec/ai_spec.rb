require "./AI"

describe "AI" do 
  subject(:ai) {AI.new({name:"bot",mark:"X"})}  
  it "inheritance works" do 
    expect(ai.name).to eql("bot")
  end
end