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

  def initialize(matrix)
    @matrix = matrix
    @n = @matrix.length
    @m = @matrix[0].length
    @dest = get_destination
    @hash = Hash.new
  end

  # find the dest position
  def get_destination
    dest_pos = nil
    (0..(@matrix.length - 1)).each { |x| (0..(@m - 1)).each { |y| dest_pos = Point.new(x, y) if @matrix[x][y] == '*' } }
    dest_pos
  end

  def min_operations(i, j, k)
    if (i == @dest.x && j == @dest.y && k == 0) then 0
    elsif ((i != @dest.x || j != @dest.y) && k == 0) then 10000
    elsif (i < 0 || i == @n || j < 0 || j == @m || (i == @dest.x && j == @dest.y)) then 10000
    else
      key = i.to_s + '_' + j.to_s + '_' + k.to_s
      puts key
      if !@hash.key?(key)
        v = [
            min_operations(i - 1, j, k - 1) + operation(i, j, i - 1, j),
            min_operations(i + 1, j, k - 1) + operation(i, j, i + 1, j),
            min_operations(i, j - 1, k - 1) + operation(i, j, i, j - 1),
            min_operations(i, j + 1, k - 1) + operation(i, j, i, j + 1)
        ].min
        @hash[key] = v
      end
      @hash[key]
    end
  end

  def operation(i, j, x, y)
    case @matrix[i][j]
      when 'U'
        if x == i - 1 && y == j then 0 else 1 end
      when 'D'
        if x == i + 1 && y == j then 0 else 1 end
      when 'L'
        if x == i && y == j - 1 then 0 else 1 end
      when 'R'
        if x == i && y == j + 1 then 0 else 1 end
      else
        10000
    end
  end
end
a = gets.split(' ').map(&:to_i)
m = Array.new
(1..a[0]).each { |i| m.push(gets.strip.split('')) }
c = CoinOnTable.new(m)
o = c.min_operations(0, 0, a[2])
if o == 10000 then puts(-1) else puts(o) end