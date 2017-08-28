M = 'land'
o = 'water'

world = [
  [o,o,o,o,o,o,o,o,o,o,o],
  [o,o,o,M,M,o,o,o,o,o,M],
  [o,o,o,o,o,o,M,o,o,o,o],
  [o,o,o,o,M,M,M,o,o,o,o],
  [o,o,o,M,M,M,M,M,o,o,o],
  [o,o,o,M,M,M,M,o,o,o,o],
  [o,o,o,o,o,M,M,M,M,o,o],
  [o,o,o,o,M,o,M,M,M,o,o],
  [o,o,o,M,M,M,M,o,M,o,o],
  [o,o,o,o,o,o,M,o,o,o,o],
  [o,o,o,o,o,o,M,o,o,M,o]
]



def cont_size world, x, y
  
  if (world[x].nil? || world[x][y].nil?) || world[x][y] != 'land'
    return 0
  end

  size = 1
  world[x][y] = 'counted land'

  size = size + cont_size(world, x-1, y-1)
  size = size + cont_size(world, x , y-1)
  size = size + cont_size(world, x+1, y+1)
  size = size + cont_size(world, x , y+1)
  size = size + cont_size(world, x-1, y )
  size = size + cont_size(world, x-1, y+1)
  size = size + cont_size(world, x+1, y )
  size = size + cont_size(world, x+1, y-1)

  size
end

puts cont_size(world, 5, 5)