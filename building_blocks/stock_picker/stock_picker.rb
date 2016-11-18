def stock_picker array
  solution = [0,1]
  profit = 0
  array.each_with_index do |buy_value,buy_index | 
    (buy_index + 1).upto(array.length-1) do |sell_index|
      if (array[sell_index] - buy_value) > profit
        solution = [buy_index , sell_index]
        profit = array[sell_index] - buy_value
      end
    end
  end
  solution
end