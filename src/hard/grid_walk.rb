class GridWalk
  @@visited = Set.new

  def self.num_of_steps(i, j)
    queue = Queue.new
    queue.enq([i, j])
    while (!queue.empty?)
      el = queue.pop
      @@visited << el
      steps = next_steps(el[0], el[1])
      if (steps.length > 0)
        steps.each { |x| queue << x }
      end
    end
    @@visited.length
  end

  def self.next_steps(i, j)
    [[i, j + 1], [i + 1, j], [i - 1, j], [i, j - 1]].keep_if { |a| sum_less_than_20?(a) && !@@visited.member?(a) }
  end

  def self.sum_less_than_20?(a)
    sum1 = digit_sum(a[0])
    sum2 = digit_sum(a[1])
    (sum1 + sum2) < 19
  end

  def self.digit_sum(x)
    if (x > -10 && x < 10) then x.abs
    else
      sum = 0
      while (x > 0)
        sum += x % 10
        x = x / 10
      end
      sum
    end
  end

  puts(num_of_steps(0, 0))
end