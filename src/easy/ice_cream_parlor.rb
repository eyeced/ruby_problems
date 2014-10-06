class IceCreamParlor

  def self.sum_equal(arr, m, i, j)
    sum = arr[i][0] + arr[j][0]
    if sum < m then sum_equal(arr, m, i + 1, j)
    elsif sum > m then sum_equal(arr, m, i, j - 1)
    else [arr[i][1], arr[j][1]]
    end
  end

  tests = gets.to_i
  (1..tests).each { |x|
    m = gets.to_i
    n = gets.to_i
    arr = gets.split(' ').each_with_index.map { |x, i| [x.to_i, i + 1] }.sort_by { |a| a[0] }
    puts(sum_equal(arr, m, 0, arr.length - 1).sort.join(' '))
  }
end