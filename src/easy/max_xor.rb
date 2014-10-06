class MaxXor
  def self.max_xor(l, r, max)
    if (l == r) then max
    else
      m = ((l + 1)..r).map { |x| l ^ x }.max
      if (m > max) then max_xor(l + 1, r, m) else max_xor(l + 1, r, max) end
    end
  end

  l = gets.to_i
  r = gets.to_i
  puts(max_xor(l, r, 0))
end