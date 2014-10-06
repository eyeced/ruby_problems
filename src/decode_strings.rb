class DecodeStrings
  def self.decode(arr)
    case
      when arr.empty?
        0
      when arr.size == 1
        1
      when arr.size == 2
        if ((arr[0] + arr[1]).to_i < 27) then 2 else 1 end
      else
        head, *tail = arr
        if ((head + arr[1]).to_i < 27) then decode(tail) + decode(tail.drop(1)) else decode(tail) end
    end
  end

  puts(decode(%w{1 2}))

end