require "./ceasar_cipher"

describe "ceasar_cipher" do
  it "translates a single character" do
    expect(ceasar_cipher "a",1).to eql("b")
  end
  it "translates a word" do
    expect(ceasar_cipher "abc",1).to eql("bcd")
  end
  it "translates multiple words" do
    expect(ceasar_cipher "abcd abcd",1).to eql("bcde bcde")
  end
  it "keeps CAPS in place" do
    expect(ceasar_cipher "Abcd",1).to eql("Bcde")
  end
  it "retains punctuation" do
    expect(ceasar_cipher "ABCD!! abcd?", 1).to eql("BCDE!! bcde?")
  end
  it "wraps around the end of the alphabet" do
    expect(ceasar_cipher "z", 1).to eql("a")
  end
  it "wraps around and keeps CAPS" do
    expect(ceasar_cipher "Zzz abc", 1).to eql("Aaa bcd")
  end
  it "handles negative values" do
    expect(ceasar_cipher "bcde BCDE",-1).to eql("abcd ABCD")
  end
end