class RobotMovements
  def self.num_of_ways(x, y, grid)
    grid[x][y] = 1
    if (x == y && x == (grid.length - 1)) then 1
    else
      moves = moves_from(x, y, grid)
      if (moves.length == 0) then 0
      else
        moves.reduce(0) { |sum, move| sum + num_of_ways(move[0], move[1], get_grid_copy(grid)) }
      end
    end
  end

  def self.get_grid_copy(grid)
    grid_c = []
    grid.each { |x| grid_c.push(x.clone) }
    grid_c
  end

  def self.moves_from(x, y, grid)
    [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]].keep_if { |a| a[0] >= 0 && a[0] < grid.length && a[1] >= 0 && a[1] < grid.length && grid[a[0]][a[1]] == 0 }
  end

  puts(num_of_ways(0, 0, [[0, 0], [0, 0]]))
end