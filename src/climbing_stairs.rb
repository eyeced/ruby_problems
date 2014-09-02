class ClimbingStairs
  @@memo = { 0 => 0, 1 => 1, 2 => 2 }
  def self.climb(n)
    if (n == 1) then 1
    elsif (n == 2) then 2
    elsif (n == 0) then 0
    else
      @@memo[n - 2] ||= climb(n - 2)
      @@memo[n - 1] ||= climb(n - 1)
      @@memo[n - 1] + @@memo[n - 2]
    end
  end

  puts(climb(10))
end