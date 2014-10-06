class SubToZero

  def self.combination(arr, n)
    if (arr.length == n) then [arr]
    elsif (n == 0) then [[]]
    else
      head, *tail = arr
      combination(tail, n - 1).map { |a| a.insert(0, head) } + combination(tail, n)
    end
  end

  File.open(ARGV[0]).each_line do |line|
    arr = line.split(',').map { |x| x.to_i }
    puts(combination(arr, 4).reject { |x| x.reduce(:+) != 0 }.length)
  end
end