class Minesweeper
  @@board = []
  def self.mine_str(str)
    arr = str.split(';')
    dim = arr[0].split(',').map(&:to_i)
    to_2d_a(dim[0], dim[1], arr[1])
  end

  def self.to_2d_a(r, c, str)
    a = str.split('')
    @@board = (0..(str.size - 1)).group_by { |i| i / c }.map { |k, v| v.map { |i| a[i] == '.' ? 0 : a[i] } }
    @@board.each_with_index { |xs, i| xs.each_with_index { |x, j| if (x == '*') then mark_board(i, j, r, c) end } }
  end

  # x, y is the row col of the mine increment all adjacent cells with 1
  def self.mark_board(x, y, r, c)
    # all possible adjacent x, y coordinates
    adj = [[x - 1, y - 1], [x - 1, y], [x - 1, y + 1], [x, y - 1], [x, y + 1], [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]].reject { |a| a[0] < 0 || a[0] >= r || a[1] < 0 || a[1] >= c }
    # after we got all possible coordinates now increment them on board
    adj.each { |a| @@board[a[0]][a[1]] += 1 if @@board[a[0]][a[1]].is_a? Integer}
  end

  puts(mine_str('3,5;**.........*...').join(''))
end