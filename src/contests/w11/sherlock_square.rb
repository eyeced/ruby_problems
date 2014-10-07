class SherlockSquare
  def self.lines(sec)
    4 + 2**(sec + 1) - 2
  end

  # (1..gets.to_i).each do |i|
  #   lines(gets.to_i)
  # end
  puts(lines(100000) % (10**9 + 7))
end