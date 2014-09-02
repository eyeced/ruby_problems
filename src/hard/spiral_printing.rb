class SpiralPrinting

  # print the 2d matrix
  def self.print(matrix)
    spiral_arr = []
    x_start = y_start = 0
    x_end = matrix.length - 1
    y_end = matrix[0].length - 1

    num = matrix.length * matrix[0].length

    while (spiral_arr.length < matrix.length * matrix[0].length)
      (y_start..y_end).each { |j| spiral_arr.push(matrix[x_start][j]) if spiral_arr.length < num }
      ((x_start + 1)..x_end).each { |i| spiral_arr.push(matrix[i][y_end]) if spiral_arr.length < num }
      (y_start..(y_end - 1)).to_a.reverse.each { |j| spiral_arr.push(matrix[x_end][j]) if spiral_arr.length < num }
      ((x_start + 1)..(x_end - 1)).to_a.reverse.each { |i| spiral_arr.push(matrix[i][y_start]) if spiral_arr.length < num }
      x_start += 1
      y_start += 1
      x_end -= 1
      y_end -= 1
    end
    puts(spiral_arr.join(' '))
  end

  def self.get_matrix(str)
    a = str.split(';')
    n = a[0].to_i
    m = a[1].to_i
    a[2].split(' ').group_by.with_index { |x, i| i / m }.map { |k, v| v }
  end

  print(get_matrix('3;8;1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24'))
end