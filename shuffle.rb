list_one = ["apple", "orange", "bear", "apple", "lovely", "Lovely", "pineapple"]

def shuffle(array_list, shuffled=[], counter=[])
  select = rand(0...array_list.length)
  if shuffled.length == array_list.length
    return shuffled
  elsif counter.index(select)
    return shuffle(array_list, shuffled, counter)
  else
    shuffled.push(array_list[select])
    counter.push(select)
    return shuffle(array_list, shuffled, counter)
  end  
end

shuffle(list_one)