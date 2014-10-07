class ClosestNumbers
  def self.closest(arr)
    pairs = []
    diff = 10000000
    (0..(arr.length - 2)).each do |i|
      cur_diff = arr[i + 1] - arr[i]
      if cur_diff < diff
        pairs = [[arr[i], arr[i + 1]]]
        diff = cur_diff
      elsif cur_diff == diff
        pairs.push([arr[i], arr[i + 1]])
      end
    end
    pairs
  end
  gets
  arr = gets.split(' ').map(&:to_i).sort
  puts(closest(arr).join(' '))
end