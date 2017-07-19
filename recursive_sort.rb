list_one = ["apple", "anna", "banana", "peach", "cherry", "kiwi", "pineapple"]

def sort_array(array_list, sorted_array=[])
  
  sorted_array.push(array_list.min)
  if array_list.length == 1
    return sorted_array
  else
    array_list.delete_at(array_list.index(array_list.min))
    return sort_array(array_list, sorted_array)
  end

end


sort_array(list_one)