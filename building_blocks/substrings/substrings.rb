def substrings (input, dictionary)
  result = Hash.new(0)
  input.split.each do |word|
    dictionary.each do |substring|
      if word.downcase.include?(substring.downcase)
        result = add_item_to_hash({:hash => result, :item => substring})
      end
    end
  end
  result
end

def add_item_to_hash(params)
  hash, item = params[:hash], params[:item]
  hash[item] += 1
  hash
end

