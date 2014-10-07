class CoinOnTable

  class Point
    attr_accessor :x, :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def == (p)
      p.x == @x && p.y == @y
    end
  end

  # find all paths which takes k times to reach destination
  def self.paths(matrix, k, cur_pos, dest_pos)
    if k == 1 then
      stps = steps(matrix, cur_pos)
      dest = stps.find { |s| s == dest_pos }
      if !dest.nil? then [dest] else [] end
    else

    end
  end

  def self.steps(matrix, cur_pos)
    positions = [Point.new(cur_pos.x - 1, cur_pos.y), Point.new(cur_pos.x, cur_pos.y - 1), Point.new(cur_pos.x + 1, cur_pos.y), Point.new(cur_pos.x, cur_pos.y + 1)]
    positions.find_all { |a| a.x >= 0 && a.x < matrix.length && a.y >= 0 && a.y < matrix[0].length && matrix[a.x][a.y] == 0 }
  end

end