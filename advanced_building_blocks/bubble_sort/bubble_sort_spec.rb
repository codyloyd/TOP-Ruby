require "./bubble_sort"

describe "bubble_sort" do 
  it "sorts an array" do 
    expect(bubble_sort([5,2,3,1,4])).to eql([1,2,3,4,5])
  end 
  it "sorts a really long obnoxious array" do
    array = Array.new(250) { rand(1000) }
    expect(bubble_sort(array)).to eql(array.sort) 
  end
end

describe "bubble_sort_by" do 
 it "works" do 
  expect(bubble_sort_by(["hi","hello","hey"]){ |left,right| left.length - right.length}).to eql(["hi","hey","hello"])
 end
 it "works with another example" do
  expect(bubble_sort_by(["c","d","a","b"]){ |left,right| left.ord - right.ord}).to eql(["a","b","c","d"])
 end  
end