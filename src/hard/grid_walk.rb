class GridWalk
  def self.num_of_steps(i, j, visited)
    # mark current coordinates as visted
    visited[[i, j]] = 1
    steps = next_steps(i, j, visited)
    p steps
    if (!steps.empty?)
      steps.each { |s| visited[s] = 1 }
      steps.length + steps.reduce { |s| num_of_steps(s[0], s[1], visited) }
    else
      0
    end
  end

  def self.next_steps(i, j, visited)
    [[i, j - 1], [i, j + 1], [i - 1, j], [i + 1, j]].keep_if { |a| sum_less_than_20?(a) && !visited.has_key?(a) }
  end

  def self.sum_less_than_20?(a)
    sum1 = digit_sum(a[0])
    sum2 = digit_sum(a[1])
    p a
    puts('sum1 - ' + sum1.to_s + ' sum2 - ' + sum2.to_s)
    (sum1 + sum2) < 20
  end

  def self.digit_sum(x)
    x.to_s.split('').map(&:to_i).map(&:abs).reduce(:+)
  end

  puts(num_of_steps(0, 0, {}))
end