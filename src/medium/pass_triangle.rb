class PassTriangle
  @@memo = {}

  def self.max_sum(arr, i, j)
    if (j == (arr.length - 1) || i == (arr.length - 1))
      arr[i][j]
    else
      @@memo[[i, j]] ||= arr[i][j] + [max_sum(arr, i + 1, j), max_sum(arr, i + 1, j + 1)].max
    end
  end

  arr = [[5], [9, 6], [4, 6, 8], [0, 7, 1, 5]]
  puts(max_sum(arr, 0, 0))
end