class Sudoku

  def self.valid?(sud)
    n = sud.length
    cum = (1..n).reduce(:^)
    rev_sud = (0..(n - 1)).map { |y| (0..(n - 1)).map { |x| sud[x][y] } }
    ((0..(n - 1)).map { |x| sud[x].reduce(:^) ^ cum }.reduce(:+) == 0 and (0..(n - 1)).map { |x| rev_sud[x].reduce(:^) ^ cum }.reduce(:+) == 0)
  end

  File.open(ARGV[0]).each_line do |line|
  # Do something with line, ignore empty lines
  #...
    arr = line.split(';')
    s = arr[1].split(',').map { |x| x.to_i }.group_by.with_index { |x, i| i / 4 }.to_a.map { |x| x[1] }
    if (valid?(s)) then puts('True') else puts('False') end
  end

end