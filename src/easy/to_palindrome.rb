class ToPalindrome
  @@s_arr = %w{a b c d e f g h i j k l m n o p q r s t u v w x y z}

  def self.num(str)
    puts(str)
    if (str.length == 1) then 0
    elsif (str.length == 2) then (@@s_arr.index(str[0]) - @@s_arr.index(str[1])).abs
    elsif (str.length == 3) then (@@s_arr.index(str[0]) - @@s_arr.index(str[2])).abs
    else
      (@@s_arr.index(str[0]) - @@s_arr.index(str[str.length - 1])).abs + num(str.slice(1, str.length - 2))
    end
  end

  # puts(num('abcba'))
  (1..STDIN.readline.to_i).each do |i|
    s = STDIN.readline
    puts(num(s.strip)) if !s.empty?
  end
end