class RadixSort

  def self.sort(arr)
    max = arr.max
    max.to_s.length.times do |i|
      # initialize bucket
      buckets = Array.new(20){[]}
      # defining the base for each loop to get the digit at that base increasing it after each loop
      bar = 10 ** i
      arr.each do |x|
        d = get_digit_at(x, bar)
        d += bar if x >= 0
        buckets[d] << x
      end
      arr = buckets.flatten
    end
    arr
  end

  # get the digit
  def self.get_digit_at(num, base)
    (num / base) % 10
  end

  p sort([2, 5, 1, 9, 8, 3, 4, -87, -47, -51, 57, 33, 34, 27, 91, 84])
end