def beers(number)
  if number == 1
    puts number.to_s + ' bottle of beer on the wall, ' + number.to_s + ' bottle of beer!'
    puts 'Drink it down, pass it around... no more bottles of beer left on the wall?!'
    puts 'No more bottles of beer on the wall, no more bottles of beer. 
Go to the store and buy some more, drink to your enemies, drink to your friends! Many more bottles of beer on the wall!'
  else
    puts number.to_s + ' bottles of beer on the wall, ' + number.to_s + ' bottles of beer!'
    puts 'Drink one down, pass it around, ' + (number - 1).to_s + ' bottles of beer on the wall!'
    return beers(number-1)
  end
end

beers(9341)