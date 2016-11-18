require "./stock_picker"

describe "stock_picker" do
  it "works lol" do
    expect(stock_picker([17,3,6,9,15,8,6,1,10])).to eq([1,4])
  end 
  it "works if lowest number is last" do
    expect(stock_picker([17,3,6,9,15,8,6,1,10,0])).to eq([1,4])
  end 
end