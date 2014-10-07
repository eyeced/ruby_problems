class Pairs
  def self.find_k_pairs(arr, k)
    i = 0
    count = 0
    while (arr[arr.length - 1] - arr[i] >= k) do
      count += 1 if !find_ele(arr, arr[i] + k, i, arr.length - 1).nil?
      i += 1
    end
    count
  end

  def self.find_ele(arr, ele, x, y)
    if x == y
      if arr[x] == ele then return x else return nil end
    end
    if (y - x == 1)
      if arr[x] == ele then return x
      elsif arr[y] == ele then return y
      else return nil
      end
    end
    mid = arr[(x + y) / 2]
    if mid == ele then mid
    elsif mid > ele then find_ele(arr, ele, x, ((x + y) / 2) - 1)
    else find_ele(arr, ele, ((x + y) / 2) + 1, y)
    end
  end

  n_k = gets.split(' ').map(&:to_i)
  k = n_k[1]
  arr = gets.split(' ').map(&:to_i).sort
  puts(find_k_pairs(arr, k))

end