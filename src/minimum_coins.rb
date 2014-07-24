class MinimumCoins
  def self.num_of_coins(n)
    case
      when n >= 5
        1 + num_of_coins(n - 5)
      when n >= 3
        1 + num_of_coins(n - 3)
      when n >= 1
        1 + num_of_coins(n - 1)
      else
        0
    end
  end

  puts(num_of_coins("11".to_i))
end