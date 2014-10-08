class SherlockSquare
  def self.lines(sec)
    fast_pow_mod(2, sec + 1, (10**9 + 7))
  end

  def self.fast_pow_mod(base, n, m)
    if n == 0 then 1
    elsif n == 1 then base
    else
      half = fast_pow_mod(base, n / 2, m)
      if n % 2 == 0
        (half * half) % m
      else
        ((half * half) * base) % m
      end
    end
  end

  # (1..gets.to_i).each do |i|
  #   lines(gets.to_i)
  # end
  puts(lines(10**9))
end