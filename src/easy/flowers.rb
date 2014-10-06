class Flowers
  def self.min_buy(rates, cur_count, friends_left)
    if friends_left == 0 then 0
    else
      head, *tail = rates
      if (head * (cur_count + 1) < tail[0]) then head * (cur_count + 1) + min_buy(rates, cur_count + 1, friends_left - 1)
      else
        tail[0] + min_buy(tail, 1, friends_left - 1)
      end
    end
  end

  def self.min(rates, k, cur)
    if rates.empty? then 0
    elsif rates.size < k then rates.inject(0) { |sum, n| sum + (n * (cur + 1))}
    else
      rates[0..(k - 1)].inject(0) { |sum, n| sum + (n * (cur + 1))} + min(rates[k..(rates.size - 1)], k, cur + 1)
    end
  end

  n_k = gets.split(' ').map(&:to_i)
  k = n_k[1]
  arr = gets.split(' ').map(&:to_i).sort.reverse

  puts min(arr, k, 0)
end