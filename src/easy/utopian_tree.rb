class UtopianTree

  def self.growth(n, is_monsoon, x)
    if (x == 0) then n
    else
      if (is_monsoon)
       growth(2 * n, false, x - 1)
      else
        growth(n + 1, true, x - 1)
      end
    end
  end

  (1..STDIN.readline.to_i).each do |i|
    puts(growth(1, true, STDIN.readline.to_i))
  end
end