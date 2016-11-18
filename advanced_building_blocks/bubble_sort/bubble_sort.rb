def bubble_sort(array)
  sorted = false
  until sorted
    sorted = true
    (array.length - 1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorted = false
      end
    end
  end
  array
end

def bubble_sort_by(array)
  sorted = false
  until sorted
    sorted = true
    (array.length - 1).times do |i|
      if yield(array[i],array[i+1]) > 0
        array[i], array[i+1] = array[i+1], array[i]
        sorted = false
      end
    end
  end
  array
end