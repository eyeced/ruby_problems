class ServiceLane

  def self.min_v(arr, s, e)
    arr.slice(s, (e - s + 1)).min
  end

  num_tests = STDIN.readline.split(' ').map(&:to_i)[1]
  arr = STDIN.readline.split(' ').map(&:to_i)

  (1..num_tests).each do |i|
    a = STDIN.readline.split(' ').map(&:to_i)
    puts(min_v(arr, a[0], a[1]))
  end
end